<%@ include file="/WEB-INF/jspf/directive/page.jspf" %>
<%@ include file="/WEB-INF/jspf/directive/taglib.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="style.css" rel="style">
<c:set var="title" value="DispatcherView" scope="page"/>
<%@ include file="/WEB-INF/jspf/head.jspf" %>
</head>
<body>
<c:if test="${param['locale'] != null}">
  <fmt:setLocale value="${param['locale']}" scope="session" />
</c:if>
<fmt:bundle basename="resources">
<%@ include file="/WEB-INF/jspf/header.jspf" %>
	<div class="successDiv">
	<c:if test="${result != null}">
  		<c:out value="${result}"/>
	</c:if>
	<fmt:message key="FormCrew"/>
	</div>
	<form method="post" action="controller" class="inline float">
	<input type="hidden" name="command" value="sortFlight"/>
	<table>
		<tr>
			<td class="fh"><button name="sortFlight" value="Id">Id</button></td>
			<td class="fh"><button name="sortFlight" value="Origin"><fmt:message key="Origin"/></button></td>
			<td class="fh"><button name="sortFlight" value="Destination"><fmt:message key="Destination"/></button></td>
			<td class="fh"><button name="sortFlight" value="Date"><fmt:message key="Date"/></button></td>
			<td class="fh"><fmt:message key="Status"/></td>
		</tr>
		<c:forEach items="${flights}" var="flight">
			<tr>
				<td class="fh">${flight.id}</td>
				<td class="fh">${flight.origin}</td>
				<td class="fh">${flight.destination}</td>
				<td class="fh">${flight.departureDate}</td>
				<td class="fh"><ex:fstatus statusId="${flight.statusId}"/></td>
			</tr>
		</c:forEach>
	</table>
	</form>
	<form action="controller" method="post" class="inline">
	<table class="float">
		<tr><td class="fh"><fmt:message key="Select"/></td></tr>
		<c:forEach items="${flights}" var="flight">
		<tr><td class="fh"><input type="radio" name="flightId" value="${flight.id}"></td></tr>
		</c:forEach>
	</table>
	<div class="controlDiv">
	<button name="command" value="formCrew" class="mAuto"><fmt:message key="Form"/></button><br/>
	<label class="mAuto"><fmt:message key="SetStatus"/></label><br/>
	<select name="statuses" class="mAuto">
		<c:forEach begin="0" end="${statuses-1}" step="1" var="index">
         <option value="${index}"><ex:fstatus statusId="${index}"/></option>
     </c:forEach> 
	</select><br/>
	<button type="submit" name="command" value="setStatus" class="mAuto"><fmt:message key="Set"/></button>
	</div>
	<table class="mAll20">
		<tr>
			<td><fmt:message key="Pilots"/></td>
			<td><select name="pilots">
			<c:forEach items="${pilots}" var="pilot">
				<option value="${pilot.id}">${pilot.firstName} ${pilot.lastName}</option>
			</c:forEach>
			</select></td>
		</tr>
		<tr>
			<td><fmt:message key="Navigators"/></td>
			<td><select name="navigators">
			<c:forEach items="${navigators}" var="navigator">
				<option value="${navigator.id}">${navigator.firstName} ${navigator.lastName}</option>
			</c:forEach>
			</select></td>
		</tr>
		<tr>
			<td><fmt:message key="Operators"/></td>
			<td><select name="operators">
			<c:forEach items="${operators}" var="operator">
				<option value="${operator.id}">${operator.firstName} ${operator.lastName}</option>
			</c:forEach>
			</select></td>
		</tr>
		<tr>
			<td><fmt:message key="Stewardessess"/></td>
			<td><select name="stewardessess">
			<c:forEach items="${stewardessess}" var="stewardess">
				<option value="${stewardess.id}">${stewardess.firstName} ${stewardess.lastName}</option>
			</c:forEach>
			</select></td>
		</tr>
	</table>
	</form>
	</fmt:bundle>
</body>
</html>