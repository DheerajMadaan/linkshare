<%@ page import="linkshare.LinkResource" %>


<div class="fieldcontain ${hasErrors(bean: linkResourceInstance, field: 'title', 'error')} required">
    <label for="title">
        <g:message code="linkResource.title.label" default="Title" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="title" required="" value="${linkResourceInstance?.title}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: linkResourceInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="linkResource.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${linkResourceInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: linkResourceInstance, field: 'linkURL', 'error')} required">
	<label for="linkURL">
		<g:message code="linkResource.linkURL.label" default="Link URL" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="linkURL" required="" value="${linkResourceInstance?.linkURL}"/>

</div>

