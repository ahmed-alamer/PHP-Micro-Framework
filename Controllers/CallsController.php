<?php 

require_once "Utils/db.php";
/**
* 
*/
class CallsController {
	
	function __construct()
	{
		$this->databaseContext = new DatabaseContext();
	}

	public function GET($parameters)
	{
		if(count($parameters) == 0) {
			return($this->databaseContext->getEntities("calls"));
		} 
		if (array_key_exists("id", $parameters)) {
			return($this->databaseContext->getEntity("calls", $parameters["id"]));
		}

		if (array_key_exists("contactId", $parameters)) {
			return($this->databaseContext->getObjectList("select calls.id, calls.callTime, calls.blog, calls.direction, calls.durationHours, calls.durationMinutes, concat(employee.firstName, ' ', employee.lastName) as employeeName from calls join contact_call on calls.id = contact_call.call_id join employee on employee.id = contact_call.employee_id where contact_id =" . $parameters["contactId"]));
		}
	}

	public function POST($parameters) {
		return $this->databaseContext->persistArray("calls",$parameters);
	}

	private $databaseContext;
}