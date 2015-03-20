var lastContent = "#calls";

function switchContext(content, title) {
	$(lastContent +"Toggle").removeClass("active");
	$(lastContent).addClass("hide");
	$("#contentTitle").text(title);
	$(content + "Toggle").addClass("active");
	$(content).removeClass("hide");
	lastContent = content;
}

/*
TODO:
1. Get accounts and contact to local variable
2. Add ID field to the form
3. Add account -> contact selector to the form, try to generate it in JS to reuse it
*/

function logCall () {
	$.ajax({
		url: "http://localhost/index.php/calls",
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
	$.ajax({
		url: "http://localhost/index.php/calls",
		type: "GET",
		success: function(calls) {
			calls.forEach(function(call) {
				$("#callsTable").append(
					"<tr>" +
					"<td>" + call.id+ "</td>" +
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

$(document).ready(function() {
	$("#meetingsToggle").click(function() {
		switchContext("#meetings", "Meetings");
	});
	$("#callsToggle").click(function() {
		switchContext("#calls", "Calls");
	});
	$("#casesToggle").click(function() {
		switchContext("#cases", "Cases");
	});
	$("#notesToggle").click(function() {
		switchContext("#notes", "Notes");
	});
	$("#btnSaveCall").click(function() {
		logCall();
	});

	getAllCalls();
});

