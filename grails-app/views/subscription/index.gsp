
<%@ page import="linkshare.Subscription" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subscription.label', default: 'Subscription')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-subscription" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		<div id="list-subscription" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
                        <th><g:message code="subscription.topic.label" default="Topic" /></th>

                        <g:sortableColumn property="subscriptionDate" title="${message(code: 'subscription.subscriptionDate.label', default: 'Subscription Date')}" />


						<th><g:message code="subscription.user.label" default="Created By" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${subscriptionInstanceList}" status="i" var="subscriptionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td>${fieldValue(bean: subscriptionInstance, field: "topic.topicName")}</td>

                        <td><g:link action="show" id="${subscriptionInstance.id}">${fieldValue(bean: subscriptionInstance, field: "subscriptionDate")}</g:link></td>
					

						<td>${fieldValue(bean: subscriptionInstance, field: "user.userId")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${subscriptionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
