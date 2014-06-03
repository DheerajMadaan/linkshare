<%@ page import="linkshare.Subscription" %>



<div class="fieldcontain ${hasErrors(bean: subscriptionInstance, field: 'subscriptionDate', 'error')} required">
	<label for="subscriptionDate">
		<g:message code="subscription.subscriptionDate.label" default="Subscription Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="subscriptionDate" precision="day"  value="${subscriptionInstance?.subscriptionDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: subscriptionInstance, field: 'topic', 'error')} required">
	<label for="topic">
		<g:message code="subscription.topic.label" default="Topic" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="topic" name="topic.id" from="${linkshare.Topic.list()}" optionKey="id" required="" value="${subscriptionInstance?.topic?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: subscriptionInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="subscription.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${linkshare.User.list()}" optionKey="id" required="" value="${subscriptionInstance?.user?.id}" class="many-to-one"/>

</div>

