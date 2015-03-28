<?php 

require_once "Utils/db.php";

/**
* 
*/
class ServiceController {
	
	function __construct() {
		$this->databaseContext = new DatabaseContext();
	}

	public function GET($parameters) {
		if(count($parameters) == 0) {
			return($this->databaseContext->getEntities("service"));
		}

		if(array_key_exists("id", $parameters)) {
			return($this->databaseContext->getEntity("service", $parameters["id"]));
		}

		if(array_key_exists("contactId", $parameters)) {
			return($this->databaseContext->getObjectList("select service.caseType, service.closeDate, service.description, service.id, service. openDate, service.priority, service.resolution, service.solved, service.state, service.workLog, concat(employee.firstName, ' ', employee.lastName) as 'employeeName' from contact_service join service on service.id = contact_service.serviceId join employee on employee.id = contact_service.employeeId where contactId = " . $parameters["contactId"]));
		}
	}
}