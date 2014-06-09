
<%@ page import="linkshare.Invitation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'invitation.label', default: 'Invitation Sent')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>

		<div id="list-invitation" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
                        <th><g:message code="invitation.topic.label" default="Topic" /></th>

                        <g:sortableColumn property="invitationDate" title="${message(code: 'invitation.invitationDate.label', default: 'Invitation Date')}" />
						<th><g:message code="invitation.user.label" default="User" /></th>
                        <th><g:message code="invitation.user.status" default="Status" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${invitationInstanceList}" status="i" var="invitationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td>${fieldValue(bean: invitationInstance, field: "topic.topicName")}</td>

                        <td><g:link action="show" id="${invitationInstance.id}">${fieldValue(bean: invitationInstance, field: "invitationDate")}</g:link></td>
						<td>${fieldValue(bean: invitationInstance, field: "user.userId")}</td>
                        <td>${invitationInstance.invitationStatus}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${invitationInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
