<?php

header("Content-Type: application/json");

$url = $_SERVER['REQUEST_URI'];

$restUrl = explode('index.php/', $url)[1];

$formattedUrl = explode("/", $restUrl);

$controllerClass = $formattedUrl[0];

// $method = $formattedUrl[1];

if(strpos($restUrl, "/?") != FALSE) {
	$parameters = array();
	$parametersUrl = explode("&", str_replace("?", "", $formattedUrl[1]));
	foreach ($parametersUrl as $parametersString) {
		$parameterPair = explode("=", $parametersString);
		$parameters[$parameterPair[0]] = $parameterPair[1];
	}
}

$controllerClass = ucfirst($controllerClass) . 'Controller';

require_once 'Controllers/' . $controllerClass . '.php';

$controller = new $controllerClass();

switch ($_SERVER['REQUEST_METHOD']) {
	case 'POST':
		echo empty($_POST) ? header('HTTP/1.1 400 Bad Request', true, 400) : $controller->POST($_POST);
		break;
	case 'GET':
		echo json_encode($controller->GET($_GET));
		break;
	case 'PUT': {
		$putParameters = array();
		foreach (explode("&", file_get_contents("php://input")) as $pair) {
			$param = explode("=", $pair);
			$putParameters[$param[0]] = $param[1];
		}
		echo json_encode($controller->PUT($putParameters));
		break;		
	}
	default:
		break;
}