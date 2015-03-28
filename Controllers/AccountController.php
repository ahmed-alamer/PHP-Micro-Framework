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
			return($this->databaseContext->getEntities("account"));
		} 

		if(array_key_exists("id", $parameters)) {
			return($this->databaseContext->getEntity("account", $parameters["id"]));
		}
	}

	public function POST($parameters) {
		return $this->databaseContext->persistArray("account", $parameters);
	}

	private $databaseContext;
}