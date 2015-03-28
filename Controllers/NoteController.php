<?php 

require_once "Utils/db.php";

/**
* 
*/
class NoteController {
	
	function __construct() {
		$this->databaseContext = new DatabaseContext();
	}

	public function GET($parameters) {
		if(count($parameters) == 0) {
			return($this->databaseContext->getEntities("notes"));
		}

		if (array_key_exists("id", $parameters)){
			return($this->databaseContext->getEntity("notes", $parameters["id"]));
		}

		if (array_key_exists("contactId", $parameters)) {
			return($this->databaseContext->getObjectList("select notes.id, notes.dateCreated, notes.details, notes.title, concat(employee.firstName, ' ', employee.lastName) as 'employeeName' from contact_note join notes on contact_note.noteId = notes.id join employee on employee.id = contact_note.employeeId where contactId = ". $parameters["contactId"]));
		}
	}

	private $databaseContext;
}