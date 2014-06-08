<%--
  Created by IntelliJ IDEA.
  User: dheerajmadaan
  Date: 5/6/14
  Time: 11:14 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">
    <script type="text/javascript" src="${resource(dir: "js",file: "jquery-1.8.2.min.js")}"></script>

    <script>
    $(document).ready(function(){
        var height=$(document.body).height()+200;
        var width=$(document.body).width()+200;
        parent.$.colorbox.resize({width:width, height:height});

    });
</script>
</head>

<body>
<g:if test="${flash.message}">
    ${flash.message}
</g:if>

<g:form controller="invitation" action="saveUserInvitation">

<table cellpadding="0" cellspacing="0" border="0">

  <tr>
      <td valign="top" width="10">
         <img src= "${resource(dir: 'images',file: 'crvBox2-tl.png')}"  height="12" width="10">
      </td>
      <td class="crvBox2-top">
      </td>
      <td valign="top" width="16">
          <img src="${resource(dir: 'images',file: 'crvBox2-tr.png')}" height="12" width="16">
      </td>
  </tr>
 <tr>
     <td class="crvBox2-left" width="100%">
     </td>
     <td class="crvBox2-bg">
          <table border="0" cellpadding="6" cellspacing="1" width="100%">
                    <tr>
                         <td colspan="4" class="hTextN15 grBborder" align="left">Invite Users</td>
                    </tr>
           </table>
      </td>
      <td class="crvBox2-right" width="100%">
      </td>
  </tr>
  <tr>
      <td class="crvBox2-left" width="100%">
      </td>
      <td class="crvBox2-bg">
          <table border="0" cellpadding="6" cellspacing="1" width="100%">
            <g:if test="${userList}">
            <%
                int count=0;
                String classRow="atlRw04 BlText12";
            %>

                  <g:each in="${userList}" status="i" var="userName">
                      <%
                          count=i;
                      %>

                      <g:if test="${i%2==0}">
                          <tr>
                      </g:if>

                      <g:if test="${i%4==0 || i%4==1}">
                          <%
                              classRow="atlRw04 BlText12";
                          %>
                      </g:if>
                          <g:else>
                              <%
                                  classRow="BlText12";
                              %>
                          </g:else>

                   <td  colspan="1" class="${classRow}" height="" align="right" valign="center" width="25.0%">
                      <g:checkBox name="userId" value="${userName}" id="${userName}" checked="false"></g:checkBox>
                  </td>
                  <td  colspan="1" class="${classRow}" valign="center" width="25.0%">${userName}</td>
                  <g:if test="${i%2!=0}">
                   </tr>
                  </g:if>
                  </g:each>
            <g:if test="${count%2==0}">
              </tr>
            </g:if>
            </g:if>
            <g:else>
                <tr>
                    <td colspan="4">
                        No Data Found
                    </td>
                </tr>
            </g:else>
          </table>
      </td>
      <td class="crvBox2-right" width="100%"></td>
  </tr>
<tr>
    <td align="left" valign="bottom">
         <img src="${resource(dir: 'images',file: 'crvBox2-bl.png')}" height="17" width="10">
    </td>
    <td class="crvBox2-botom"></td>
    <td align="right" valign="bottom">
        <img src="${resource(dir: 'images',file: 'crvBox2-br.png')}" height="17" width="16">
    </td>
</tr>


</table>
<table>
    <tr>
        <td>
            <g:hiddenField name="topicId" value="${params.topicId}"></g:hiddenField>
            <g:submitButton name="submit" class="new_buttonY">Invite Users</g:submitButton>
        </td>

    </tr>
</table>
           </g:form>

</body>
</html>