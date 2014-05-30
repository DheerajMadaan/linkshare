<%@ page import="linkshare.Topic; linkshare.LinkResource" %>



<g:if test="${!params.fromWhere && !"edit".equals(actionName)}">
    <div class="fieldcontain ${hasErrors(bean: linkResourceInstance, field: 'topic.id', 'error')} required">
        <label for="topic">
            <g:message code="documentResource.topic.label" default="Topic Name" />
            <span class="required-indicator">*</span>
        </label>
        <g:select name="topic.id" from="${ Topic.withCriteria(){
            or {
                eq("visibility", "Public")
                user {
                    eq("userId", (session.userId).toString())

                }
            }
        }}" optionKey="id" optionValue="topicName"  style="width:200px" />
    </div>

</g:if>

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
	<g:textField name="linkURL" required="" url="true" value="${linkResourceInstance?.linkURL}"/>

</div>

<g:if test="${params.fromWhere}">
    <g:hiddenField name="topic.id" value="${params.topic}" />
</g:if>