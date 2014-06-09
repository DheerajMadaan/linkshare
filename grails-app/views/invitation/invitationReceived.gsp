
<%@ page import="com.linkshare.enums.InvitationStatus; linkshare.Invitation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'invitation.label', default: 'Invitation Received')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
    <g:javascript>
    function changeInvitationStatus(index,topicId,status){

       $("#topicId").val(topicId);
       $("#status").val(status);
      var message=status=="ACCEPTED"?"Accept":"Reject";
       var flag=confirm("Are you sure you want to "+message+" this invitation?");
        if(flag)
        $("#changeStatusForm").submit();
       /* $.ajax({
               url:url,
               data:{'topicId':topicId,'status':status},
               success:function(data){
               if("true"==data){
                  if("REJECTED"==status){
                     $("#"+index+"_REJECTED").show();
                     $("#"+index+"_ACCEPTED").hide();
                     $("#status_"+index).html("Accepted")
                  }else
                  {
                     $("#"+index+"_REJECTED").hide();
                     $("#"+index+"_ACCEPTED").show();
                     $("#status_"+index).html("Rejected")

                  }

               }

               }
            });*/
    }
    </g:javascript>
	</head>
	<body>
    <g:form action="changeInvitationStatus" method="post" name="changeStatusForm" id="changeStatusForm">
        <g:hiddenField name="topicId" id="topicId"></g:hiddenField>
        <g:hiddenField name="status" id="status"></g:hiddenField>

    </g:form>

		<div id="list-invitation" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
                        <th width="20%"><g:message code="invitation.topic.label" default="Topic" /></th>

                        <th width="20%"><g:message code="invitation.user.label" default="Invited By" /></th>
                        <g:sortableColumn property="invitationDate" title="${message(code: 'invitation.invitationDate.label', default: 'Invitation Date')}"  />
                        <th width="20%"><g:message code="invitation.user.status" default="Status" /></th>
                        <th width="20%"><g:message code="invitation.user.status" default="Action" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${invitationInstanceList}" status="i" var="invitationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td width="20%">${fieldValue(bean: invitationInstance, field: "topic.topicName")}</td>

                        <td width="20%">${fieldValue(bean: invitationInstance, field: "invitedBy.userId")}</td>
                        <td width="20%">${fieldValue(bean: invitationInstance, field: "invitationDate")}</td>
                        <td width="20%" id="status_${i}">${(invitationInstance.invitationStatus).getInvitationStatus()}</td>
                        <td width="20%">
                            <%
                                switch (invitationInstance.invitationStatus){
                                    case  "PENDING":%>
                                         <img  style="display: inline;" src="${resource(dir:'images',file:'accept.jpg' )}" width="32px" height="32px" title="Accept" onclick="changeInvitationStatus(${i},${invitationInstance.topic.id},'ACCEPTED')">&nbsp;
                                         <img  style="display: inline;" src="${resource(dir:'images',file:'reject.jpg' )}"  title="Reject" width="35px" height="35px" onclick="changeInvitationStatus(${i},${invitationInstance.topic.id},'REJECTED')">
                                    <%break; case  "ACCEPTED":%>
                                     -
                                    <%break;case  "REJECTED":%>
                                      -

                                 <% } %>

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${invitationInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
