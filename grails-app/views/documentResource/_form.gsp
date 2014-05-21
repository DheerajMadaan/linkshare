<%@ page import="linkshare.DocumentResource" %>

<div class="fieldcontain ${hasErrors(bean: documentResourceInstance, field: 'title', 'error')} required">
    <label for="title">
        <g:message code="documentResource.title.label" default="Title" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="title" required="" value="${documentResourceInstance?.title}"/>

</div>



<div class="fieldcontain ${hasErrors(bean: documentResourceInstance, field: 'description', 'error')} required">
    <label for="description">
		<g:message code="documentResource.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
   <input type="file" name="fileName" />

</div>

<div class="fieldcontain ${hasErrors(bean: documentResourceInstance, field: 'documentSize', 'error')} required">
    <label for="documentSize">
		<g:message code="documentResource.documentSize.label" default="Document Size" />
		<span class="required-indicator">*</span>
	</label>
    <g:textField name="documentSize" required="" value="${documentResourceInstance?.documentSize}"/>

</div>



