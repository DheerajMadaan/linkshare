
<%@ page import="linkshare.ResourceStatus; linkshare.DocumentResource" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'documentResource.label', default: 'Document')}" />
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

		<a href="#list-documentResource" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		<div id="list-documentResource" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" />
                <g:if test="${topicName}">
                   Of Topic: ${topicName}
            </g:if>
            <g:link controller="documentResource" action="create" style="float:right">Add Document</g:link>
            </h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>

                        <g:sortableColumn property="title" title="${message(code: 'documentResource.title.label', default: 'Title')}" />
                        <g:sortableColumn property="description" title="${message(code: 'documentResource.description.label', default: 'Description')}" />
                        <g:sortableColumn property="fileType" title="${message(code: 'documentResource.topic.label', default: 'Topic Name')}" />
                        <g:sortableColumn property="fileName" title="${message(code: 'documentResource.documentSize.label', default: 'File Name')}" />

                        <g:sortableColumn property="fileType" title="${message(code: 'documentResource.documentType.label', default: 'File Type')}" />
                        <g:sortableColumn property="fileType" title="${message(code: 'documentResource.action.label', default: 'Action')}" />


					</tr>
				</thead>
				<tbody>
				<g:each in="${documentResourceInstanceList}" status="i" var="documentResourceInstance">

					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <%
                            def fileName=documentResourceInstance?.fileName?.substring(0,documentResourceInstance.fileName.lastIndexOf("-"))
                            ResourceStatus rs=documentResourceInstance.resourceStatus.find(){
                                it.user.id=1;

                            }
                            def imageName="unread".equals(rs?.readStatus)?"mailUnread.jpg":"mailRead.jpg"

                        %>
                        <td>${fieldValue(bean: documentResourceInstance, field: "title")}</td>
                        <td><g:link action="show" id="${documentResourceInstance.id}">${fieldValue(bean: documentResourceInstance, field: "description")}</g:link></td>
                        <td>${fieldValue(bean: documentResourceInstance, field: "topic.topicName")}</td>
                        <td><g:link controller="documentResource" action="fileDownload" params="[fileName:documentResourceInstance?.fileName,fileType:documentResourceInstance?.fileType]" ><%= fileName %></g:link></td>


                        <td>${fieldValue(bean: documentResourceInstance, field: "fileType")}</td>
                          <td><img width="30px" id="mail_${documentResourceInstance.id}" height="30px" src="${resource(dir:'images',file:imageName)}"
                          onClick='changeStatus(${documentResourceInstance.id});' ></td>


					</tr>
				</g:each>
                <g:if test="${documentResourceInstanceCount==0}">
                    <tr class="even">
                        <td colspan="4" >No Data Found</td>

                    </tr>
                </g:if>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${documentResourceInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
