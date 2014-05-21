<%--
  Created by IntelliJ IDEA.
  User: dheerajmadaan
  Date: 15/5/14
  Time: 12:40 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css' ,file: 'view.css')}" media="all">

</head>
<body id="main_body" >

<div id="form_container">

<h1><a>Link Share</a></h1>
<g:form name="register" action="addUser" method="post">

<div class="form_description">
    <h2>Registration Form</h2>
</div>

    <g:hasErrors>
        <div class="errors">
            <g:renderErrors bean="${userInstance}" as="list" />
        </div>
    </g:hasErrors>
<ul>
    <li id="li_1" >
       <label class="description" for="userId">User Id </label>
           <div>
                 <input id="userId" name="userId" class="element text medium" type="text" required maxlength="255" value="${userInstance?.userId}"/>
                 <g:hasErrors bean="${userInstance}" field="userId">
                 <g:eachError bean="${userInstance}" field="userId">

            <p style="color: red;"><g:message error="${it}"/></p>

        </g:eachError>
          </g:hasErrors>
           </div>
    </li>
    <li id="li_2" >
       <label class="description" for="password">Password </label>
           <div>
                <input id="password" name="password" class="element text medium" type="password" maxlength="255" value="${userInstance?.password}"/>
           </div>
    </li>		<li id="li_3" >
    <label class="description" for="confirmPassword">Confirm Password </label>
    <div>
        <input id="confirmPassword" name="confirmPassword" class="element text medium" type="password" maxlength="255" value="${userInstance?.confirmPassword}"/>
    </div>
</li>		<li id="li_4" >
    <label class="description" for="address">Address </label>
    <div>
        <input id="address" name="address" class="element text medium" type="text" maxlength="255" value="${userInstance?.address}"/>
    </div>
    </li>
 <li id="li_5" >
    <label class="description" for="emailId">Email Id </label>
    <div>
        <input id="emailId" name="emailId" class="element text medium" type="text" maxlength="255" value="${userInstance?.emailId}"/>
    </div>
    </li>
</li>	

<li class="buttons">

<g:submitButton name="submit" class="button_text" value="Submit" />
</g:form>
</li>
</ul>
</form>

</div>
</body>
</html>