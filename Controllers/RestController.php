<?php 

require_once "Utils/db.php";

class RestController
{
	
	function __construct()
	{
		# code...
	}

	public function GET($parameters)
	{
		$context = new DatabaseContext();
		$obj = new stdClass();
		$obj->name = "John";
		$obj->address = "Stamford";

		echo $context->persistObject("employee", $obj);

		// echo json_encode($context->getObjectList("show tables"));
	}

	public function POST($parameters)
	{
		$json = json_encode($parameters);
		echo $json;
	}
}