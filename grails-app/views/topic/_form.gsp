<%@ page import="linkshare.Topic" %>



<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'topicName', 'error')} required">
	<label for="topicName">
		<g:message code="topic.topicName.label" default="Topic Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="topicName" maxlength="100" required="" value="${topicInstance?.topicName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="topic.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
    <g:hiddenField name="user.id" id="userId" value="${session.userId}" />
	<g:textField name="description" required="" value="${topicInstance?.description}"/>


</div>
<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'visibility', 'error')} required">

    <label for="visibility">
        <g:message code="topic.visibility.label" default="Visibility" />
        <span class="required-indicator">*</span>
    </label>
    <g:message code="topic.visibility.label" default="Private" />
    <g:radio name="visibility" value="Private" ></g:radio>
    <g:message code="topic.visibility.label" default="Public" />
    <g:radio name="visibility" value="Public" checked="checked"></g:radio>

</div>

