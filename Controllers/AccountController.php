<?php

require_once "Utils/db.php";

/**
* Accounts Repository
*/

class AccountController
{
	
	function __construct() {
		$this->databaseContext = new DatabaseContext();
	}

	public function GET($parameters) {
		if(count($parameters) == 0) {
			echo json_encode($this->databaseContext->getEntities("account"));
		} 

		if(array_key_exists("id", $parameters)) {
			echo json_encode($this->databaseContext->getEntity("account", $parameters["id"]));
		}
	}

	public function POST($parameters) {
		echo $databaseContext->persistArray("account", $parameters);
	}

	private $databaseContext;
}