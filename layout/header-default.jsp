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
		<link rel="stylesheet" href="<%= request.getContextPath() %>/css/prueba.css" type="text/css" />
		<link rel="stylesheet" href="<%= request.getContextPath() %>/css/sidebarleft.css" type="text/css" />
		<link rel="stylesheet" href="<%= request.getContextPath() %>/css/news.css" type="text/css" />
	    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/flotante.css" type="text/css" />
	    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/menu-movil.css" type="text/css" />
		<!--Iconos Open Source Google-->
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/animation.css" type="text/css" />
		<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0/dist/Chart.min.js"></script>
		

				
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
	
<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId            : 'your-app-id',
      autoLogAppEvents : true,
      xfbml            : true,
      version          : 'v3.2'
    });
  };
</script>

<script>
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "https://connect.facebook.net/es_LA/sdk/xfbml.customerchat.js";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
</script>


<div id="fb-root"></div>
<script async defer src="https://connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v3.2"></script>

<div id="fb-root"></div>
<script async defer src="https://connect.facebook.net/es_ES/sdk.js#xfbml=1&version=v3.2"></script>


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

	<div class="left" id="flotante">
		
		<div class="item item-lateral" onclick=location.href="<%= request.getContextPath() %>/"> 	
			<i class="material-icons">home</i> Aramara
		</div>
		<div class="item item-lateral" onclick=location.href="<%= request.getContextPath() %>/community-list">
			<i class="material-icons">people</i> Comunidades
		</div>
		<div class="item item-lateral" onclick=location.href="<%= request.getContextPath() %>/policy.jsp">
			<i class="material-icons">bookmark</i> Políticas Inst.
		</div>
		<div class="item item-lateral" onclick=location.href="/jspui/browse?type=dateissued">
			<i class="material-icons">description</i> Publicaciones
		</div>
		<div class="item item-lateral" onclick=location.href="<%= request.getContextPath() %>/self-archive">
			<i class="material-icons">library_add</i> Auto Archivo
		</div>
		<div class="item item-lateral" onclick=location.href="<%= request.getContextPath() %>/statics">
			<i class="material-icons">donut_small</i> Estadísticas
		</div>
		<div class="item item-lateral" onclick=location.href="#contacto_ref">
			<i class="material-icons">assignment_ind</i> Contacto
		</div>
	</div>
	<main id="content" role="main">
		<div class="container banner">
			<div class="row">
				<div class="col-md-2 pull-center">
					<img alt="Logo" class="img-responsive" src="image/ARAMARA V8.png" style="max-height: 500px !important" /> 
				</div>
		<div class="col-md-8" align="center">
            <div class="pull-center" align="center">
				<h1>Bienvenido al Repositorio Institucional Aramara</h1>
				<p><b>Comunidad Cientifica Virtual de Acceso Abierto</b><p/>
                <div class="fb-like" data-href="https://www.facebook.com/AramaraRI" data-layout="button_count" data-action="like" data-size="small" data-show-faces="false" data-share="true">
				</div>				
			</div>
		</div>
             <!-- <div class="col-md-3"><img class="pull-center" src="<%= request.getContextPath() %>/image/logo.png" alt="DSpace logo" />-->
				<div class="col-md-2">
					<img alt="Logo" class="img-responsive" src="image/OPEN ACCESS CHAQUIRA.png" style="max-height: 190px !important; margin-top: -.8em !important" /> 
				</div>
			</div>
		</div>
<div class="container">
    <div class="row">
        <div class="col-md-12">
		</div>
	
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
