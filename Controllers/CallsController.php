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
			echo json_encode($this->databaseContext->getEntities("calls"));
		} else {
			echo json_encode($this->databaseContext->getEntity("calls", $parameters["id"]));
		}
	}

	public function POST($parameters) {
		echo $this->databaseContext->persistArray("calls",$parameters);
	}

	private $databaseContext;
}