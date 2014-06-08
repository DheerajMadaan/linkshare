
<%@ page import="linkshare.Topic" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
 	</head>
	<body>

    <div class="container-fluid">
		<div id="list-topic" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" />
            <g:link  action="create" style="float:right"><g:message code="default.new.label" args="[entityName]" /></g:link>
            </h1>


			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="ui table segment">
			<thead>
					<tr>

						<g:sortableColumn property="topicName" title="${message(code: 'topic.topicName.label', default: 'Topic Name')}" />

						<g:sortableColumn property="description" title="${message(code: 'topic.description.label', default: 'Description')}" />

						<th><g:message code="topic.user.label" default="User" /></th>
                        <th><g:message code="topic.visibility.label" default="Visibility" /></th>

					</tr>
				</thead>
				<tbody>
				<g:each in="${topicInstanceList}" status="i" var="topicInstance">
					<tr class="${(i % 2) == 0 ? 'positive' : '  '}">

						<td><g:link action="show" id="${topicInstance.id}">${fieldValue(bean: topicInstance, field: "topicName")}</g:link></td>

						<td>${fieldValue(bean: topicInstance, field: "description")}</td>

						<td>${fieldValue(bean: topicInstance, field: "user.userId")}</td>
                        <td><gui:toolTip text="hello">${fieldValue(bean: topicInstance, field: "visibility")}</gui:toolTip> </td>

					</tr>
				</g:each>
                <g:if test="${topicInstanceCount==0}">
                    <tr class="even">
                        <td colspan="4" >No Data Found</td>

                    </tr>
                </g:if>
                %{--<tr>
                 <td>
                  <g:form action="ajax" name="ajaxForm">
                     <g:textField name="test"></g:textField>

                     <g:submitToRemote url="[action:'ajax']"  onSuccess="javascript:myFun(data)" value="hi"/>
                  </g:form>
                 </td>

                </tr>--}%
				</tbody>


            </table>

			<div class="pagination">
				<g:paginate total="${topicInstanceCount ?: 0}" />
			</div>
		</div>
</div>
	</body>

</html>
