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
		if (array_key_exists("productId", $parameters) & array_key_exists("accountId", $parameters)) {
			return $this->databaseContext->persistArray("account_product",
				array(
					"accountId" => $parameters["accountId"], 
					"productId" => $parameters["productId"]
				)
			);
		} else {
			return $this->databaseContext->persistArray("account", $parameters);	
		}
	}

	public function PUT($parameters) {
		return $this->databaseContext->updateObject("account", $parameters);		
	}

	private $databaseContext;
}