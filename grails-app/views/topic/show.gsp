
<%@ page import="linkshare.Topic" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>

        <style>
        a{
            text-decoration: none;
        }
        </style>
	</head>

	<body>
		<a href="#show-topic" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-topic" class="content scaffold-show" role="main">
			<div>
            <h1 ><g:message code="default.show.label" args="[entityName]" />
            <g:link  controller="documentResource" action="create" params="[topic:topicInstance?.id]" style="float:right"> <g:message code="default.add.Document" default="Add Document" /></g:link>
            <g:link  controller="linkResource" action="create" params="[topic:topicInstance?.id]" style="float:right;margin-right: 15px;"> <g:message code="default.add.Link" default="Add Link" /></g:link>

            </h1>

			</div>
                <g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list topic">
			
				<g:if test="${topicInstance?.topicName}">
				<li class="fieldcontain">
					<span id="topicName-label" class="property-label"><g:message code="topic.topicName.label" default="Topic Name" /></span>
					
						<span class="property-value" aria-labelledby="topicName-label"><g:fieldValue bean="${topicInstance}" field="topicName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${topicInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="topic.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${topicInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${topicInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="topic.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${topicInstance?.user?.id}">${topicInstance?.user.userId?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
                <g:if test="${topicInstance?.visibility}">
                    <li class="fieldcontain">
                        <span id="description-label" class="property-label"><g:message code="topic.description.label" default="Visibility" /></span>

                        <span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${topicInstance}" field="visibility"/></span>

                    </li>
                </g:if>
			
			</ol>
			<g:form url="[resource:topicInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${topicInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
