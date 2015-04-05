var lastContent = "#calls";

var backEndUrlBase = "http://localhost/index.php/";

var accountId = null;

var contactId = null;

function switchContext(content, title) {
	$(lastContent +"Toggle").removeClass("active");
	$(lastContent).addClass("hide");
	$("#contentTitle").text(title);
	$(content + "Toggle").addClass("active");
	$(content).removeClass("hide");
	lastContent = content;
}

/*
TODO: DONE!
1. Get accounts and contact to local variable
2. Add ID field to the form
3. Add account -> contact selector to the form, try to generate it in JS to reuse it
*/

function logCall () {
	$.ajax({
		url: backEndUrlBase + "calls",
		type: "POST",
		data: {
			"callTime": $("#callTime").val(),
			"blog": $("#blog").val(),
			"durationHours": $("#durationHours").val(),
			"durationMinutes": $("#durationMinutes").val(),
			"direction": $("#direction").val()
		},
		success: function(result) {
			console.log(result);
		},
		error: function(xhr) {
			console.log(xhr);
			console.log("You Fucked Up!");
		},
		complete: function() {
			$("#newCallForm")[0].reset();
			$("#newCall").modal('hide');
		}
	});
}

function translateDirection(direction) {
	if(direction == "1") {
		return "Outbound";
	}
	if(direction == "0") {
		return "Inbound";
	}
	return direction;
}

function getAllCalls () {
	if(contactId == null) {
		return;
	}
	$.ajax({
		url: backEndUrlBase + "calls" + "/?contactId=" + contactId,
		type: "GET",
		success: function(calls) {
			$("#callsTable").empty();
			calls.forEach(function(call) {
				$("#callsTable").append(
					"<tr>" +
					"<td>" + call.id+ "</td>" +
					"<td>" + call.employeeName + "</td>" +
					"<td>" + translateDirection(call.direction) + "</td>" +
					"<td>" + call.callTime.split("T")[0] + "</td>" +
					"<td>" + call.durationHours + ":" + call.durationMinutes + "</td>" +
					"<td>" + call.blog + "</td>" +
					"</tr>"
				);
			});
		},
		error: function() {
			console.log("You Fucked Up!");
		}
	});
}

function getMeetings () {
	$.ajax({
		url: backEndUrlBase + "meeting/?contactId=" + contactId,
		type: "GET",
		success: function(meetings) {
			$("#meetingsTable").empty();
			meetings.forEach(function(meeting) {
				$("#meetingsTable").append(
					"<tr>" +
					"<td>" + meeting.id + "</td>" +
					"<td>" + meeting.location + "</td>" +
					"<td>" + meeting.durationHours + ":" + meeting.durationMinutes + "</td>" +
					"<td>" + meeting.status + "</td>" +
					"<td>" + meeting.meetingType + "</td>" +
					"<td>" + meeting.employeeName + "</td>" +
					"<td>" + meeting.description + "</td>" +
					"</tr>"
				);
			});
		}
	});
}

function getNotes () {
	$.ajax({
		url: backEndUrlBase + "note/?contactId=" + contactId,
		type: "GET",
		success: function(notes) {
			$("#notesTable").empty();
			notes.forEach(function(note) {
				$("#notesTable").append(
					"<tr>" +
					"<td>" + note.id + "</td>" +
					"<td>" + note.title + "</td>" +
					"<td>" + note.employeeName + "</td>" +
					"<td>" + note.dateCreated + "</td>" +
					"</tr>"
				);
			});
		}
	});
}

function getAccounts () {
	$.ajax({
		url: backEndUrlBase + "account",
		type: "GET",
		success: function(accounts) {
			accounts.forEach(function(account) {
				$("#accountSelector").append(
					"<option value='"+account.id+"'>"+account.companyName+"</option>"
				);				
			});
		}
	});
}

function getContacts (accountId) {
	$.ajax({
		url: backEndUrlBase + "contact/?accountId=" + accountId,
		type: "GET",
		success: function(contacts) {
			contacts.forEach(function(contact) {
				$("#contactSelector").append(
					"<option value='"+contact.id+"'>"+contact.firstName + " " + contact.lastName+"</option>"
				);
			});
		}
	});
}

function getServiceCases () {
	$.ajax({
		url: backEndUrlBase + "service/?contactId=" + contactId,
		type: "GET",
		success: function(services) {
			$("#casesTable").empty();
			services.forEach(function(service) {
				$("#casesTable").append(
					"<tr>" +
					"<td>" + service.id + "</td>" +
					"<td>" + service.caseType + "</td>" +
					"<td>" + service.openDate + "</td>" +
					"<td>" + service.employeeName + "</td>" +
					"<td>" + service.priority + "</td>" +
					"<td>" + service.state + "<td>" +
					"<td>" + service.description + "</td>"
				);
			});
		},
		error: function(xhr, xhrObject, message) {
			console.log(xhr);
			console.log(xhrObject);
			console.log(message);
		}
	});	
}

function updateUI(lastContext) {
	switch(lastContext) {
		case "#calls":
			getAllCalls();
			break;
		case "#meetings":
			getMeetings();
			break;
		case "#notes":
			getNotes();
			break;
		case "#cases":
			getServiceCases();
			break;
	}
}

function updateData (context) {
	switch(context) {
		case "#calls":
			getAllCalls();
			break;
		case "#meetings":
			getMeetings();
			break;
		case "#notes":
			getNotes();
			break;
		case "#cases":
			getServiceCases();
			break;
	}
}

$(document).ready(function() {
	$("#meetingsToggle").click(function() {
		switchContext("#meetings", "Meetings");
		getMeetings();
	});
	$("#callsToggle").click(function() {
		switchContext("#calls", "Calls");
		getAllCalls();
	});
	$("#casesToggle").click(function() {
		switchContext("#cases", "Cases");
		getServiceCases();
	});
	$("#notesToggle").click(function() {
		switchContext("#notes", "Notes");
		getNotes();
	});
	$("#btnSaveCall").click(function() {
		logCall();
	});

	$("#accountSelector").change(function() {
		accountId = $(this).val();
		$("#contactSelector").empty().append("<option value='empty'>Select Contact...</option>");
		getContacts($(this).val());
	});

	$("#contactSelector").change(function() {
		contactId = $(this).val();
		updateUI(lastContent);
	});

	getAccounts();
});

