<?php

// function getDB()
// {
// 	return new PDO('mysql:host=localhost;dbname=clear_crm', 'root', 'kokojumbo');
// }

// function executeQuery($queryString)
// {
// 	return getDB()->query($queryString)->fetchAll(PDO::FETCH_OBJ);
// }

// print_r(executeQuery("show tables"));
// $db = new PDO('mysql:host=localhost;dbname=clear_crm', 'root', 'kokojumbo');

// print_r($db->query("show tables")->fetchAll(PDO::FETCH_OBJ));

class DatabaseContext
{
	
	function __construct()
	{
		$this->database = new PDO(
			'mysql:host=localhost;dbname=clear_crm', 'root', 'kokojumbo'
		);
	}

	public function getDB()
	{
		return $this->database;
	}


	public function getObject($queryString) {
		return $this->database->query($queryString)->fetch(PDO::FETCH_OBJ);
	}

	public function getObjectList($queryString) {
		return $this->database->query($queryString)->fetchAll(PDO::FETCH_OBJ);
	}

	private $database;
}

$context = new DatabaseContext();

print_r($context->getObjectList("show tables"));

// print_r($context->query("show tables"));

// print_r($context->getDB()->query("show tables")->fetchAll(PDO::FETCH_OBJ));
