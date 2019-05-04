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
		<link rel="stylesheet" href="<%= request.getContextPath() %>/css/buttons-recursos.css" type="text/css" />
		<link rel="stylesheet" href="<%= request.getContextPath() %>/css/navigation-bar.css" type="text/css" />
		<link rel="stylesheet" href="<%= request.getContextPath() %>/css/sidebarleft.css" type="text/css" />
		<link rel="stylesheet" href="<%= request.getContextPath() %>/css/news.css" type="text/css" />
	    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/flotante.css" type="text/css" />
		<!-- Hojas de estilo para la barra flotante iconos y parametros -->
	    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/flotante.css" type="text/css"/>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous" />
		<!--Buttons Agregados para la Seccion de Servicios-->
		<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/fontawesome/4.7.0/css/font-awesome.min.css" />
		<!--Footer-->
		<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
		<link rel="stylesheet" href="<%= request.getContextPath() %>/css/socialnetworks.css" type="text/css" />
		<link rel="stylesheet" href="<%= request.getContextPath() %>/css/logo.css" type="text/css" />
		<!--youtube-->
		<link rel="stylesheet" href="<%= request.getContextPath() %>/css/youtube.css" type="text/css" />
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

    <%--Gooogle Analytics recording.--%>
    <%
    if (analyticsKey != null && analyticsKey.length() > 0)
    {
    %>
        <script type="text/javascript">
            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', '<%= analyticsKey %>']);
            _gaq.push(['_trackPageview']);

            (function() {
                var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
            })();
        </script>

    <%
    }
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
            jQuery(document).ready(function(){
                jQuery('#slider').slippry()
            });
				 
        </script>
	
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

<script>

    /* Light YouTube Embeds by @labnol */
    /* Web: http://labnol.org/?p=27941 */

    document.addEventListener("DOMContentLoaded",
        function() {
            var div, n,
                v = document.getElementsByClassName("youtube-player");
            for (n = 0; n < v.length; n++) {
                div = document.createElement("div");
                div.setAttribute("data-id", v[n].dataset.id);
                div.innerHTML = labnolThumb(v[n].dataset.id);
                div.onclick = labnolIframe;
                v[n].appendChild(div);
            }
        });

    function labnolThumb(id) {
        var thumb = '<img src="https://i.ytimg.com/vi/ID/hqdefault.jpg">',
            play = '<div class="play"></div>';
        return thumb.replace("ID", id) + play;
    }

    function labnolIframe() {
        var iframe = document.createElement("iframe");
        var embed = "https://www.youtube.com/embed/ID?autoplay=1";
        iframe.setAttribute("src", embed.replace("ID", this.dataset.id));
        iframe.setAttribute("frameborder", "0");
        iframe.setAttribute("allowfullscreen", "1");
        this.parentNode.replaceChild(iframe, this);
    }

</script
<div id="fb-root"></div>
<script async defer src="https://connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v3.2"></script>

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
		<div class="item">
			<i class="fas fa-fw fa-bars"></i>
		</div>
		<div class="item item-lateral" onclick=location.href="<%= request.getContextPath() %>/">
			<i class="fas fa-fw fa-home"></i> Aramara
		</div>
		<div class="item item-lateral" onclick=location.href="<%= request.getContextPath() %>/community-list">
			<i class="fas fa-fw fa-users"></i> Comunidades
		</div>
		<div class="item item-lateral" onclick=location.href="<%= request.getContextPath() %>/browse?type=dateissued">
			<i class="fas fa-fw fa-bookmark"></i> Publicaciones
		</div>
		<div class="item item-lateral" onclick=location.href="<%= request.getContextPath() %>/policy.jsp">
			<i class="fas fa-fw fa-gavel"></i> Políticas
		</div>
		<div class="item item-lateral" onclick=location.href="<%= request.getContextPath() %>/statistics">
			<i class="fas fa-fw fa-bar-chart"></i> Estadísticas
		</div>
		<div class="item item-lateral" onclick=location.href="#contacto_ref">
			<i class="fas fa-fw fa-address-book"></i> Contacto
		</div>
	</div>
	<main id="content" role="main">
		<div class="container banner">
			<div class="row">
				<div class="col-md-2" align="center">
					<img alt="Logo" class="img-responsive" src="/image/aramara_logo.png" style="max-height: 256px" /> 
				</div>
		<div class="col-md-8" align="center">
            <div class="pull-center" align="center">
				<h1>Repositorio Institucional Aramara</h1>
				<p><b>Comunidad Científica Virtual de Acceso Abierto</b><p/>
                <div class="fb-like" data-href="https://www.facebook.com/AramaraRI" data-layout="button_count" data-action="like" data-size="small" data-show-faces="false" data-share="true">
				</div>				
			</div>
		</div>
             <!-- <div class="col-md-3"><img class="pull-center" src="<%= request.getContextPath() %>/image/logo.png" alt="DSpace logo" />-->
				<div class="col-md-2" align="center">
					<img alt="Logo" class="img-responsive" src="/image/open_access_chaquira.png" style="max-height: 256px" /> 
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
					  <a href="<%= request.getContextPath() %>/"><img src="<%= request.getContextPath() %>/image/slider/aramara_banner_web.png"></a>
					</li>
					<li>
					  <a href="https://www.repositorionacionalcti.mx/"><img src="<%= request.getContextPath() %>/image/slider/instituciones_repo.jpg"></a>
					</li>
					<li>
					  <a href="<%= request.getContextPath() %>/"><img src="<%= request.getContextPath() %>/image/slider/descripcion_ria.jpg"></a>
					</li>
					<li>
					  <a href="<%= request.getContextPath() %>/"><img src="<%= request.getContextPath() %>/image/slider/promocion_ria.jpg"></a>
					</li>
					<li>
					  <a href="http://dspace.uan.mx:8080/jspui/handle/123456789/65"><img src="<%= request.getContextPath() %>/image/slider/algebra_ria.jpg"></a>
					</li>
					<li>
					  <a href="http://dspace.uan.mx:8080/jspui/handle/123456789/1271"><img src="<%= request.getContextPath() %>/image/slider/orga_enfermeria_ria.jpg"></a>
					</li>
					<li>
					  <a href="http://aramara.uan.mx:8080/jspui/handle/123456789/1133"><img src="<%= request.getContextPath() %>/image/slider/medios_ria.jpg"></a>
					</li>
					<li>
					  <a href="http://aramara.uan.mx:8080/jspui/handle/123456789/1098"><img src="<%= request.getContextPath() %>/image/slider/ambiente_ria.jpg"></a>
					</li>
					<li>
					  <a href="http://aramara.uan.mx:8080/jspui/handle/123456789/221" ><img src="<%= request.getContextPath() %>/image/slider/suelo_ria.jpg"></a>
					</li>
					<li>
					  <a href="http://aramara.uan.mx:8080/jspui/handle/123456789/1274"><img src="<%= request.getContextPath() %>/image/slider/alcohol_ria.jpg"></a>
					</li>
					<li>
					  <a href="https://docs.google.com/forms/d/e/1FAIpQLSfMiyiyw90WRYW2hsv1Wo55OgdoNYJdkfnKVuCuesgA3uoMPw/viewform?fbclid=IwAR2iO9hYIDQxz0XcrNn5OuGqVb8vUSDLAKYax0yIr43OOEOPbVgM9TmVw4w"><img src="<%= request.getContextPath() %>/image/slider/convocatoria_ria.jpg"></a>
					</li>
					<li>
					  <a href="https://www.repositorionacionalcti.mx/"><img src="<%= request.getContextPath() %>/image/slider/repo_nacional.jpg"></a>
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
