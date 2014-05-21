
<%@ page import="linkshare.DocumentResource" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'documentResource.label', default: 'DocumentResource')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-documentResource" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-documentResource" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list documentResource">
			
				<g:if test="${documentResourceInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="documentResource.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${documentResourceInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentResourceInstance?.documentSize}">
				<li class="fieldcontain">
					<span id="documentSize-label" class="property-label"><g:message code="documentResource.documentSize.label" default="Document Size" /></span>
					
						<span class="property-value" aria-labelledby="documentSize-label"><g:fieldValue bean="${documentResourceInstance}" field="documentSize"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentResourceInstance?.documentType}">
				<li class="fieldcontain">
					<span id="documentType-label" class="property-label"><g:message code="documentResource.documentType.label" default="Document Type" /></span>
					
						<span class="property-value" aria-labelledby="documentType-label"><g:fieldValue bean="${documentResourceInstance}" field="documentType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentResourceInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="documentResource.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${documentResourceInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:documentResourceInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${documentResourceInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
