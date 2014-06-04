<%--
  Created by IntelliJ IDEA.
  User: dheerajmadaan
  Date: 14/5/14
  Time: 3:36 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> 	<html lang="en"> <!--<![endif]-->
<head>


    <!-- General Metas -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	<!-- Force Latest IE rendering engine -->
    <title>Login Form</title>
    <meta name="description" content="">
    <meta name="author" content="">
    <!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

    <!-- Stylesheets -->
    <link rel="stylesheet" href="${resource(dir:'css',file: 'base.css')}">
    <link rel="stylesheet" href="${resource(dir:'css',file: 'skeleton.css')}">
    <link rel="stylesheet" href="${resource(dir:'css',file: 'layout.css')}">

</head>
<body>


<!-- Primary Page Layout -->


<div class="container" style="margin-top:150px">
<g:hasErrors bean="${loginErrors}">

    <div class="alert alert-error" align="center" style="margin-left:200px;margin-right:200px;">



        <ul class="errors" role="alert">
            <g:eachError bean="${loginErrors}" var="error">
                <li><g:message error="${error}"/></li>
            </g:eachError>

        </ul>

    </div>
</g:hasErrors>
    <div class="form-bg">
        <g:form action="summary1" controller="user" name="loginForm" >

            <h2>Login</h2>
            <p>
                <g:textField name="userId" placeholder="Username" ></g:textField>
            </p>
            <p>
                <g:passwordField name="password" placeholder="Password" ></g:passwordField>
            </p>
            <g:submitButton  name="submit" value="Login"  style="margin-left:20px"   />
            <g:link action="register" style="text-decoration:none" >
            <input type="button"  name="register" value="Register"    />
            </g:link>

         </g:form>
    </div>


    <p class="forgot">Forgot your password? <a href="">Click here to reset it.</a></p>


</div><!-- container -->

<!-- JS  -->


<!-- End Document -->
</body>
</html>