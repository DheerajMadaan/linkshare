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
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css' ,file: 'bootstrap.min.css')}" media="all">

    <style>
body {
    padding-top: 50px;
    padding-bottom: 20px;
}
</style>
</head>
<body id="main_body" >

<div>
    <div class="container">

        <p align="center" style="color: #ffffff">Congratulations! Your Account has been successfully created.</p>
        <p align="center"> <g:link class="btn btn-primary btn-lg" role="button" action="login">Click Me To Login &raquo;</g:link></p>
    </div>
</div>
</body>
</html