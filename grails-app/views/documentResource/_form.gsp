<%@ page import="linkshare.Topic; linkshare.DocumentResource" %>

<g:if test="${!params.fromWhere && !"edit".equals(actionName)}">
    <div class="fieldcontain ${hasErrors(bean: documentResourceInstance, field: 'topic.id', 'error')} required">
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
    <g:textField name="description" required="" value="${documentResourceInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: documentResourceInstance, field: 'fileName', 'error')} required">
    <label>
		<g:message code="documentResource.documentSize.label" default="Upload File " />
		<span class="required-indicator">*</span>
	</label>
  <input type="file" name="fileName"   />


<g:if test="${params.fromWhere}">
<g:hiddenField name="topic.id" value="${params.topic}" />
</g:if>

