
<%@ page import="linkshare.Subscription" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subscription.label', default: 'Subscription')}" />
	 	<title><g:message code="default.list.label" args="[entityName]" /></title>


        <script type="text/javascript" src="${resource(dir: "js",file: "jquery-1.8.2.min.js")}"></script>
        <script type="text/javascript" src="${resource(dir: "js",file: "jquery.colorbox.js")}"></script>
        <link type="text/css"  rel="stylesheet" href="${resource(dir: "css" , file: "colorbox.css")}" />
      %{--  <g:javascript library="colorbox"/>
        <g:javascript library="jquery"/>--}%
        <g:javascript>
         $(document).ready(function(){
             $("a.group").colorbox({width:600,height:600, iframe:true});
         })
        </g:javascript>
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
                        <th><g:message code="subscription.user.label" default="Send Invitation" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${subscriptionInstanceList}" status="i" var="subscriptionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td>${fieldValue(bean: subscriptionInstance, field: "topic.topicName")}</td>

                        <td><g:link action="show" id="${subscriptionInstance.id}"> ${fieldValue(bean: subscriptionInstance, field: "subscriptionDate")}</g:link></td>
					

						<td>${fieldValue(bean: subscriptionInstance, field: "topic.user.userId")}</td>
                        <td><g:link action="inviteUsers" controller="user" class="group" params="[topicId: subscriptionInstance.topic.id]"><img src="${resource(dir: 'images',file: 'invite.jpeg')}" height="20px" width="20px"></g:link></td>
					
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
