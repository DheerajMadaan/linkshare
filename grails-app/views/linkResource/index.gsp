
<%@ page import="linkshare.ResourceStatus; linkshare.LinkResource" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'linkResource.label', default: 'Link')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
        <g:javascript>
        function changeStatus(rId){
            var url="${createLink(action:'changeReadStatus',controller:'resource')}"

            $.ajax({
               url:url,
               data:{'resourceId':rId},
               success:function(data){
                   if(data=="unread"){
                       $("#mail_"+rId).attr("src","${resource(dir:'images',file:'mailUnread.jpg')}");
                   }  else if(data=="read"){
                       $("#mail_"+rId).attr("src","${resource(dir:'images',file:'mailRead.jpg')}");
                   }
               }
            });



        }
        </g:javascript>
	</head>
	<body>
		<a href="#list-linkResource" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		<div id="list-linkResource" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" />
            <g:link controller="linkResource" action="create" style="float:right">Add Link</g:link>
            </h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>

			<table>
			<thead>
					<tr>

                        <g:sortableColumn property="title" title="${message(code: 'linkResource.title.label', default: 'Title')}" />
                        <g:sortableColumn property="description" title="${message(code: 'linkResource.description.label', default: 'Description')}" />

                        <g:sortableColumn property="linkURL" title="${message(code: 'linkResource.linkURL.label', default: 'Link URL')}" />
                        <g:sortableColumn property="title" title="${message(code: 'linkResource.topicTitle.label', default: 'Topic')}" />
                        <g:sortableColumn property="fileType" title="${message(code: 'documentResource.action.label', default: 'Action')}" />

					</tr>
				</thead>
				<tbody>
				<g:each in="${linkResourceInstanceList}" status="i" var="linkResourceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					  <%
                          ResourceStatus rs=linkResourceInstance.resourceStatus.find(){
                              it.user.id=1;

                          }
                          def imageName="read".equals(rs?.readStatus)?"mailRead.jpg":"mailUnread.jpg"
					  %>
						<td><g:link action="show" id="${linkResourceInstance.id}">${fieldValue(bean: linkResourceInstance, field: "description")}</g:link></td>

						<td>${fieldValue(bean: linkResourceInstance, field: "linkURL")}</td>

						<td>${fieldValue(bean: linkResourceInstance, field: "title")}</td>
                        <td>${fieldValue(bean: linkResourceInstance, field: "topic.topicName")}</td>
                        <td><img width="30px" id="mail_${linkResourceInstance.id}" height="30px" src="${resource(dir:'images',file:imageName)}"
                                 onClick='changeStatus(${linkResourceInstance.id});' ></td>

					</tr>
				</g:each>
                <g:if test="${linkResourceInstanceCount==0}">
                    <tr class="even">
                        <td colspan="4" >No Date Found</td>

                    </tr>
                </g:if>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${linkResourceInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
