<?php 

require_once "Utils/db.php";

/**
* 
*/
class MeetingController {
	
	function __construct() {
		$this->dataContext = new DatabaseContext();
	}

	public function GET($parameters) {
		if(count($parameters) == 0) {
			return($this->dataContext->getEntities("meeting"));
		} 
		if (array_key_exists("id", $parameters)) {
			return($this->dataContext->getEntity("meeting", $parameters["id"]));
		}
		if (array_key_exists("contactId", $parameters)) {
			return($this->dataContext->getObjectList("select meeting.id, meeting.agenda, meeting.blog, meeting.description, meeting.durationHours, meeting.durationMinutes, meeting.emailReminderTime, meeting.externalId, meeting.id, meeting.joinUrl, meeting.location, meeting.meetingType, meeting.reminderTime, meeting.scheduledFor, meeting.status, concat(employee.firstName, ' ', employee.lastName) as 'employeeName' from contact_meeting join meeting on meeting.id = contact_meeting.meetingId join employee on contact_meeting.employeeId = employee.id where contact_meeting.contactId = " . $parameters["contactId"]));
		}
	}

	public function POST($parameters) {
		return $this->dataContext->persistArray("meeting", $parameters);
	}

	private $dataContext;
}