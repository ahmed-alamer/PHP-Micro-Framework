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
		echo json_encode($controller->POST($_POST));
		break;
	case 'GET':
		echo json_encode($controller->GET($_GET));
		break;
	default:
		break;
}