<%@ page import="linkshare.User" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <script type="text/javascript" src="${resource(dir: "js",file: "jquery-1.8.2.min.js")}"></script>


    <g:layoutHead/>
		<g:javascript library="application"/>
        <g:javascript library="bootstrap"/>
      
        <r:layoutResources />
        <nav:resources/>

	</head>
	<body>
    <div class="navbar navbar-inverse" role="navigation">
        <div class="container-fluid" >
            <div class="navbar-header">

                <a class="navbar-brand" href="#">LinkShare</a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav ">
                    <li><g:link class="list" action="index" controller="topic"><g:message code="default.topic.name"  default="Topic" /></g:link></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            Resource
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">

                            <li><g:link class="list" action="index" controller="linkResource"><g:message code="default.new.document" default="Links" /></g:link></li>
                             <li><g:link class="list" action="index" controller="documentResource"><g:message code="default.new.document" default="Documents" /></g:link></li>
                         </ul>
                            <li><g:link class="list" action="index" controller="subscription"><g:message code="default.new.document" default="Subscribed Topics" /></g:link></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            Invitation
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">

                            <li><g:link class="list" action="index" controller="invitation"><g:message code="default.new.document" default="Sent" /></g:link></li>
                            <li><g:link class="list" action="index" controller="invitation"><g:message code="default.new.document" default="Received" /></g:link></li>
                        </ul>
                </ul>

            </div>
        </div>
    </div>

    <r:layoutResources />
       <div class="container-fluid shadow" style="margin-left:20px;margin-right:20px;">
        <g:layoutBody/>
       </div>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>

    </body>
</html>
