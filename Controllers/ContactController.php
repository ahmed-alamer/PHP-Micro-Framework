<?php 

require_once "Utils/db.php";

/**
* 
*/
class ContactController {
	
	function __construct() {
		$this->databaseContext = new DatabaseContext();
	}

	public function GET($parameters) {
		if(count($parameters) == 0) {
			echo json_encode($this->databaseContext->getEntities("contact"));
		}
		if(array_key_exists("id", $parameters)) {
			echo json_encode($this->databaseContext->getEntity("contact", $parameters["id"]));
		}

		if(array_key_exists("accountId", $parameters)) {
			echo json_encode($this->databaseContext->getObjectList("select * from contact join account_contact on contact.id = account_contact.contactId where account_contact.accountId = " . $parameters["accountId"]));
		}

	}

	private $databaseContext;
}