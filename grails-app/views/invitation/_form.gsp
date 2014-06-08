<%@ page import="linkshare.Invitation" %>



<div class="fieldcontain ${hasErrors(bean: invitationInstance, field: 'invitationDate', 'error')} required">
	<label for="invitationDate">
		<g:message code="invitation.invitationDate.label" default="Invitation Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="invitationDate" precision="day"  value="${invitationInstance?.invitationDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: invitationInstance, field: 'invitedBy', 'error')} required">
	<label for="invitedBy">
		<g:message code="invitation.invitedBy.label" default="Invited By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="invitedBy" name="invitedBy.id" from="${linkshare.User.list()}" optionKey="id" required="" value="${invitationInstance?.invitedBy?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: invitationInstance, field: 'topic', 'error')} required">
	<label for="topic">
		<g:message code="invitation.topic.label" default="Topic" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="topic" name="topic.id" from="${linkshare.Topic.list()}" optionKey="id" required="" value="${invitationInstance?.topic?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: invitationInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="invitation.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${linkshare.User.list()}" optionKey="id" required="" value="${invitationInstance?.user?.id}" class="many-to-one"/>

</div>

