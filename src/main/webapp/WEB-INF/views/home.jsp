<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link href="/static/style.css" rel="stylesheet" />

</head>
<body>

	</div>
		<div class="accordion" id="accordionExample" style="width:50%">
		<div class="card">
			<div class="card-header" id="headingOne">
				<h2 class="mb-0">
					<button class="btn btn-link btn-block text-left" type="button"
						data-toggle="collapse" data-target="#collapseOne"
						aria-expanded="true" aria-controls="collapseOne">Voter
						local election data</button>
				</h2>
			</div>
			<div id="collapseOne" class="collapse show"
				aria-labelledby="headingOne" data-parent="#accordionExample">
				<div class="card-body">
				</div>
			</div>
		</div>
		<div class="card">
			<div class="card-header" id="headingTwo">
				<h2 class="mb-0">
					<button class="btn btn-link btn-block text-left collapsed"
						type="button" data-toggle="collapse" data-target="#collapseTwo"
						aria-expanded="false" aria-controls="collapseTwo">
						Representative data</button>
				</h2>
			</div>
			<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
				data-parent="#accordionExample">
				<div class="card-body">
					<table>
						<tr>
							<th>Official's Name</th>
							<th>Official's Address</th>
							<th>Official's Party</th>
							<th>Official's Email Address</th>
						</tr>

						<c:forEach items="${civicResponse.offices}" var="office">
							<tr>
								<td><c:out value="${office.name}" /></td>

								<td>
									<ul>
										<c:forEach items="${office.officialIndices}" var="index">
											<li><c:out value="${civicResponse.officials.get(index).name}" /></li>

										</c:forEach>
									</ul>
								</td>
									<c:forEach items="${office.officialIndices}" var="index">
										<td><c:out value="${civicResponse.officials.get(index).address}"/></td>
	      								<td><c:out value="${civicResponse.officials.get(index).party}"/></td>
	      								<td><c:out value="${civicResponse.officials.get(index).emails}"/></td>
	      							</c:forEach>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
		<div class="card">
			<div class="card-header" id="headingThree">
				<h2 class="mb-0">
					<button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
						Voter Registration Information
					</button>
				</h2>
			</div>
			<div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
				<div class="card-body">
						<div>
							<c:out value="${stateResponse.state.details.voterReg}" escapeXml="false"/>
						</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="voter-data">
		<p>
		<p>Name - ${ voter.name }</p>
		<p>Phone - ${ voter.phone }</p>
		<p>Street Address - ${ voter.address }</p>
		<p>City - ${ voter.city }</p>
		<p>State - ${ voter.state }</p>
		<p>Zip Code - ${ voter.zip }</p>
		<p>Party Preference - ${ voter.partyPref }</p>
		<p>Is this person voting by mail? - ${ voter.voteByMail }</p>
		<p>Next Scheduled Call - ${ voter.nextCall }</p>
		<p>Last Call - ${ voter.lastCall }</p>

		<p>${ voter.result }</p>

		</p>


	<div><jsp:include page="main-script.jsp"/></div>
	

	<form action="/submit">
		<div>
			<input class="note-text" type="text" name="notes"
				value="${ voter.notes }">
		</div>
		<div>
			<input type = "hidden"name = "voterId" value = "${voter.id}">

			<input type="radio" id="NA" name="result" value="NA" required>
			<label for="NA">No answer/Voicemail</label><br> 
			<input type="radio" id="RQ" name="result" value="RQ"> 
			<label for="RQ">Requested callback</label><br> 
			<input type="datetime-local" name="nextCall"> 
			<input type="radio" id="VIP" name="result" value="VIP"> 
			<label for="VIP">Will vote in person</label><br> 
			<input type="radio" id="WVBM" name="result" value="WVBM"> 
			<label for="WVBM">Will register to Vote by Mail</label><br>
			<input type="radio" id="AVBM" name="result" value="AVBM">
			<label for="AVBM">Already registered to Vote by Mail</label><br> 
			<input type="radio" id="NV" name="result" value="NV"> 
			<label for="NV">Not voting</label><br> 
			<input type="radio" id="DNC" name="result" value="DNC"> 
			<label for="DNC">Do not call</label><br>
		</div>
		<div>
			<button name="button" value="next" onClick="mySavedNoteAlert()">Submit/Next</button>
			<button name="button" value="end">Submit/END</button>
		</div>
	</form>


	</p>
	</div>

	




	<!-- <p>${ civicResponse }</p>  -->
	<!-- <p>${ civicResponse.normalizedInput }</p>  -->
	<!-- <p>${ civicResponse.offices }</p>  -->
	<!-- <p>${ civicResponse.officials }</p> -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>
		<script>
		function mySavedNoteAlert(){
			alert("Notes saved successfully!");
		}
		</script>
</body>
</html>