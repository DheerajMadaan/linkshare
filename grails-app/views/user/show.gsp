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
    <g:form name="login" action="login" method="post">

        <div class="form_description">
            <h2>User Details</h2>
        </div>


        <ul>
            <li id="li_1" >
               <label class="description">User Id </label>
                 <span>
                 ${user?.userId}
                 </span>
 </li>
       	<li id="li_4" >
        <label class="description" >Address </label>
            <span>
                <g:message message="${user?.address}"/>
            </span>
    </li>
        <li id="li_5" >
            <label class="description" >Email Id </label>
            <span>
                <g:message message="${user?.emailId}"/>
            </span>
        </li>
        </li>

        <li class="buttons">

        <g:submitButton name="login" class="button_text" value="Login" />
    </g:form>
</li>
</ul>


</div>
</body>
</html>