<?php 

require_once "Utils/db.php";

/**
* 
*/
class OpportunityController {
	
	function __construct() {
		$this->databaseContext = new DatabaseContext();
	}

	public function GET($parameters) {
		
		if (count($parameters) == 0) {
			return($this->databaseContext->getEntities("opportunity"));
		}

		if (array_key_exists("id", $parameters)) {
			return($this->databaseContext->getEntity("opportunity", $parameters["id"]));
		}

		if (array_key_exists("contactsFor", $parameters)) {
			return($this->databaseContext->getObjectList("select contactId from contact_opprtunity where opportunityId=" . $parameters["contactsFor"]));
		}
	}
}