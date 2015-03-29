<?php 

require_once "Utils/db.php";

/**
* 
*/
class ProductController {
	
	function __construct() {
		$this->databaseContext = new DatabaseContext();
	}

	public function GET($parameters) {
		if (count($parameters) == 0) {
			return $this->databaseContext->getEntities("product");	
		}
		if (array_key_exists("id", $parameters)) {
			return $this->databaseContext->getEntity("product", $parameters["id"]);
		}		

		if (array_key_exists("accountId", $parameters)) {
			return $this->databaseContext->getObjectList("select productId as id from account_product where accountId=".$parameters["accountId"]);
		}
	}

	public function POST($parameters) {
		$this->databaseContext->persistArray("product", $parameters);
		return "Saved!";
	}

	private $databaseContext;
}