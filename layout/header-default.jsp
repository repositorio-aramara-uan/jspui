<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - HTML header for main home page
  --%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="java.util.List"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="org.dspace.app.webui.util.JSPManager" %>
<%@ page import="org.dspace.core.ConfigurationManager" %>
<%@ page import="org.dspace.app.util.Util" %>
<%@ page import="javax.servlet.jsp.jstl.core.*" %>
<%@ page import="javax.servlet.jsp.jstl.fmt.*" %>

<%
    String title = (String) request.getAttribute("dspace.layout.title");
    String navbar = (String) request.getAttribute("dspace.layout.navbar");
    boolean locbar = ((Boolean) request.getAttribute("dspace.layout.locbar")).booleanValue();

    String siteName = ConfigurationManager.getProperty("dspace.name");
    String feedRef = (String)request.getAttribute("dspace.layout.feedref");
    boolean osLink = ConfigurationManager.getBooleanProperty("websvc.opensearch.autolink");
    String osCtx = ConfigurationManager.getProperty("websvc.opensearch.svccontext");
    String osName = ConfigurationManager.getProperty("websvc.opensearch.shortname");
    List parts = (List)request.getAttribute("dspace.layout.linkparts");
    String extraHeadData = (String)request.getAttribute("dspace.layout.head");
    String extraHeadDataLast = (String)request.getAttribute("dspace.layout.head.last");
    String dsVersion = Util.getSourceVersion();
    String generator = dsVersion == null ? "DSpace" : "DSpace "+dsVersion;
    String analyticsKey = ConfigurationManager.getProperty("jspui.google.analytics.key");
%>

<!DOCTYPE html>
<html>
    <head>
        <title><%= siteName %>: <%= title %></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="Generator" content="<%= generator %>" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="<%= request.getContextPath() %>/favicon.ico" type="image/x-icon"/>
        <link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/jquery-ui-1.10.3.custom/redmond/jquery-ui-1.10.3.custom.css" type="text/css" />
        <link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/bootstrap/bootstrap.min.css" type="text/css" />
        <link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/bootstrap/bootstrap-theme.min.css" type="text/css" />
        <link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/bootstrap/dspace-theme.css" type="text/css" />
        <!-- Archivo css de la libreria 'slippry', plugin del carousel de imagenes -->
        <link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/slippry/slippry.css" type="text/css" />
		<link rel="stylesheet" href="<%= request.getContextPath() %>/css/buttons.css" type="text/css" />
		<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<%
    if (!"NONE".equals(feedRef))
    {
        for (int i = 0; i < parts.size(); i+= 3)
        {
%>
        <link rel="alternate" type="application/<%= (String)parts.get(i) %>" title="<%= (String)parts.get(i+1) %>" href="<%= request.getContextPath() %>/feed/<%= (String)parts.get(i+2) %>/<%= feedRef %>"/>
<%
        }
    }
    
    if (osLink)
    {
%>
        <link rel="search" type="application/opensearchdescription+xml" href="<%= request.getContextPath() %>/<%= osCtx %>description.xml" title="<%= osName %>"/>
<%
    }

    if (extraHeadData != null)
        { %>
<%= extraHeadData %>
<%
        }
%>
        
        <script type='text/javascript' src="<%= request.getContextPath() %>/static/js/jquery/jquery-1.10.2.min.js"></script>
        <script type='text/javascript' src='<%= request.getContextPath() %>/static/js/jquery/jquery-ui-1.10.3.custom.min.js'></script>
        <script type='text/javascript' src='<%= request.getContextPath() %>/static/js/bootstrap/bootstrap.min.js'></script>
        <script type='text/javascript' src='<%= request.getContextPath() %>/static/js/holder.js'></script>
        <script type="text/javascript" src="<%= request.getContextPath() %>/utils.js"></script>
        <script type="text/javascript" src="<%= request.getContextPath() %>/static/js/choice-support.js"> </script>

        <!-- Archivo javascript de la libreria 'slippry', plugin del carousel de imagenes -->
        <script type="text/javascript" src="<%= request.getContextPath() %>/static/js/slippry/slippry.min.js"> </script>

        <dspace:include page="/layout/google-analytics-snippet.jsp" />

        <script>
            jQuery(document).ready(function(){
                jQuery('#slider').slippry()
            });
        </script>

    <%
    if (extraHeadDataLast != null)
    { %>
        <%= extraHeadDataLast %>
    <%
    }
    %>
    

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="<%= request.getContextPath() %>/static/js/html5shiv.js"></script>
  <script src="<%= request.getContextPath() %>/static/js/respond.min.js"></script>
<![endif]-->
    </head>

    <%-- HACK: leftmargin, topmargin: for non-CSS compliant Microsoft IE browser --%>
    <%-- HACK: marginwidth, marginheight: for non-CSS compliant Netscape browser --%>
    <body class="undernavigation">
<a class="sr-only" href="#content">Skip navigation</a>
<header class="navbar navbar-inverse navbar-fixed-top">    
    <%
    if (!navbar.equals("off"))
    {
%>
            <div class="container">
                <dspace:include page="<%= navbar %>" />
            </div>
<%
    }
    else
    {
    %>
        <div class="container">
            <dspace:include page="/layout/navbar-minimal.jsp" />
        </div>
<%
    }
%>
</header>

<main id="content" role="main">
<div class="container banner">
    <div class="row">
		<div class="col-md-13" align="center">
			<div class="btn-group btn-group-toggle" data-toggle="buttons">
				<input type="button" name="home" class="btn btn-success" value="Aramara" title="" onclick=location.href="<%= request.getContextPath() %>/home.jsp"> 
				<input type="button" name="buttom1" class="btn btn-primary" value="Comunidades" title="" onclick=location.href="<%= request.getContextPath() %>/community-list.jsp">
				<input type="button" name="buttom2" class="btn btn-primary" value="Politicas" title="" onclick=location.href="<%= request.getContextPath() %>/policy.jsp">
				<input type="button" name="buttom3" class="btn btn-primary" value="Publicaciones" title="" onclick=location.href="/jspui/browse?type=dateissued">
				<input type="button" name="buttom4" class="btn btn-primary" value="Autores" title="" onclick=location.href="/jspui/browse?type=author">
				<input type="button" name="buttom5" class="btn btn-primary" value="Areas Academicas" title="" onclick=location.href="/jspui/browse?type=subject">
				<input type="button" name="buttom6" class="btn btn-primary" value="Estadisticas" title="" onclick=location.href="<%= request.getContextPath() %>/statics.jsp">
				<input type="button" name="buttom7" class="btn btn-primary" value="Autoarchivo" title="" onclick=location.href="<%= request.getContextPath() %>/self-archive.jsp">
			</div>
            <div class="pull-center" align="center">
				<h1>Bienvenido al Repositorio Institucional Aramara</h1>
				<p>Comunidad Cientifica virtual de acceso abierto para todos<p/> 
            </div>
             <!-- <div class="col-md-3"><img class="pull-center" src="<%= request.getContextPath() %>/image/logo.png" alt="DSpace logo" /> -->
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
			<!-- Inicio - Carousel de imagenes -->
			<div style="margin-center: -2em !important">
				<ul id="slider">
					<li>
					  <a href="#slide1"><img src="<%= request.getContextPath() %>/image/slider/slide01.jpg" alt="Bienvenido"></a>
					</li>
					<li>
					  <a href="#slide2"><img src="<%= request.getContextPath() %>/image/slider/slide02.jpg"  alt="Bienvenido"></a>
					</li>
					<li>
					  <a href="#slide3"><img src="<%= request.getContextPath() %>/image/slider/slide03.jpg" alt="Bienvenido"></a>
					</li>
					<li>
					  <a href="#slide3"><img src="<%= request.getContextPath() %>/image/slider/slide04.jpg" alt="Bienvenido"></a>
					</li>
				</ul>
			</div>
			<!-- Fin - Carousel de imagenes -->
        </div>
    </div>
</div>
<br/>
<br/>
                <%-- Location bar --%>
<%
    if (locbar)
    {
%>
<div class="container">
    <dspace:include page="/layout/location-bar.jsp" />
</div>                
<%
    }
%>


        <%-- Page contents --%>
<div class="container">
<% if (request.getAttribute("dspace.layout.sidebar") != null) { %>
    <div class="row">
    <div class="col-md-9">
<% } %>	
