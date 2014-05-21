
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-profile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create" controller="topic"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="list-profile" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

%{--
            <g:sortableColumn property="name" title="${message(code: 'user.userId.label', default: 'Name')}" />
--}%

        </tr>
        </thead>
        <tbody>
      %{--  <g:each in="${profileInstanceList}" status="i" var="profileInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show" id="${profileInstance.id}">${fieldValue(bean: profileInstance, field: "name")}</g:link></td>

            </tr>
        </g:each>--}%
        </tbody>
    </table>
    %{--<div class="pagination">
        <g:paginate total="${profileInstanceCount ?: 0}" />
    </div>--}%
</div>
</body>
</html>
