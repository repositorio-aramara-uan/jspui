<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Home page JSP
  -
  - Attributes:
  -    communities - Community[] all communities in DSpace
  -    recent.submissions - RecetSubmissions
  --%>

<%@page import="org.dspace.core.Utils"%>
<%@page import="org.dspace.content.Bitstream"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>

<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Locale"%>
<%@ page import="javax.servlet.jsp.jstl.core.*" %>
<%@ page import="javax.servlet.jsp.jstl.fmt.LocaleSupport" %>
<%@ page import="org.dspace.core.I18nUtil" %>
<%@ page import="org.dspace.app.webui.util.UIUtil" %>
<%@ page import="org.dspace.app.webui.components.RecentSubmissions" %>
<%@ page import="org.dspace.content.Community" %>
<%@ page import="org.dspace.core.ConfigurationManager" %>
<%@ page import="org.dspace.core.NewsManager" %>
<%@ page import="org.dspace.browse.ItemCounter" %>
<%@ page import="org.dspace.content.Metadatum" %>
<%@ page import="org.dspace.content.Item" %>

<%
    Community[] communities = (Community[]) request.getAttribute("communities");

    Locale sessionLocale = UIUtil.getSessionLocale(request);
    Config.set(request.getSession(), Config.FMT_LOCALE, sessionLocale);
    String topNews = NewsManager.readNewsFile(LocaleSupport.getLocalizedMessage(pageContext, "news-top.html"));
    String sideNews = NewsManager.readNewsFile(LocaleSupport.getLocalizedMessage(pageContext, "news-side.html"));

    boolean feedEnabled = ConfigurationManager.getBooleanProperty("webui.feed.enable");
    String feedData = "NONE";
    if (feedEnabled)
    {
        feedData = "ALL:" + ConfigurationManager.getProperty("webui.feed.formats");
    }
    
    ItemCounter ic = new ItemCounter(UIUtil.obtainContext(request));

    RecentSubmissions submissions = (RecentSubmissions) request.getAttribute("recent.submissions");
%>

<dspace:layout locbar="nolink" titlekey="jsp.home.title" feedData="<%= feedData %>">


<div class="row">
<%
if (submissions != null && submissions.count() > 0)
{
%>
        <div class="col-md-8">
        <div class="panel panel-primary">        
        <div id="recent-submissions-carousel" class="panel-heading carousel slide">
          <h3><fmt:message key="jsp.collection-home.recentsub"/>
              <%
    if(feedEnabled)
    {
	    	String[] fmts = feedData.substring(feedData.indexOf(':')+1).split(",");
	    	String icon = null;
	    	int width = 0;
	    	for (int j = 0; j < fmts.length; j++)
	    	{
	    		if ("rss_1.0".equals(fmts[j]))
	    		{
	    		   icon = "rss1.gif";
	    		   width = 80;
	    		}
	    		else if ("rss_2.0".equals(fmts[j]))
	    		{
	    		   icon = "rss2.gif";
	    		   width = 80;
	    		}
	    		else
	    	    {
	    	       icon = "rss.gif";
	    	       width = 36;
	    	    }
	%>
	    <a href="<%= request.getContextPath() %>/feed/<%= fmts[j] %>/site"><img src="<%= request.getContextPath() %>/image/<%= icon %>" alt="RSS Feed" width="<%= width %>" height="15" style="margin: 3px 0 3px" /></a>
	<%
	    	}
	    }
	%>
          </h3>
          
		  <!-- Wrapper for slides -->
		  <div class="carousel-inner">
		    <%
		    boolean first = true;
		    for (Item item : submissions.getRecentSubmissions())
		    {
		        Metadatum[] dcv = item.getMetadata("dc", "title", null, Item.ANY);
		        String displayTitle = "Untitled";
		        if (dcv != null & dcv.length > 0)
		        {
		            displayTitle = Utils.addEntities(dcv[0].value);
		        }
		        dcv = item.getMetadata("dc", "description", "abstract", Item.ANY);
		        String displayAbstract = "";
		        if (dcv != null & dcv.length > 0)
		        {
		            displayAbstract = Utils.addEntities(dcv[0].value);
		        }
		%>
		    <div style="padding-bottom: 50px; min-height: 200px;" class="item <%= first?"active":""%>">
		      <div style="padding-left: 80px; padding-right: 80px; display: inline-block;"><%= StringUtils.abbreviate(displayTitle, 400) %> 
		      	<a href="<%= request.getContextPath() %>/handle/<%=item.getHandle() %>" class="btn btn-success">See</a>
                        <p><%= StringUtils.abbreviate(displayAbstract, 500) %></p>
		      </div>
		    </div>
		<%
				first = false;
		     }
		%>
		  </div>

		  <!-- Controls -->
		  <a class="left carousel-control" href="#recent-submissions-carousel" data-slide="prev">
		    <span class="icon-prev"></span>
		  </a>
		  <a class="right carousel-control" href="#recent-submissions-carousel" data-slide="next">
		    <span class="icon-next"></span>
		  </a>

          <ol class="carousel-indicators">
		    <li data-target="#recent-submissions-carousel" data-slide-to="0" class="active"></li>
		    <% for (int i = 1; i < submissions.count(); i++){ %>
		    <li data-target="#recent-submissions-carousel" data-slide-to="<%= i %>"></li>
		    <% } %>
	      </ol>
     </div></div></div>
<%
}
%>
<div class="container text-center">
<!--Icon made by Freepik from www.flaticon.com -->
			<div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12"> 
            <div class="site-heading text-center">
			<h3>Recursos</h3>
			<p>Conoce nuestros recursos</p>
			<div class="border"></div>
		</div>
            </div> 
			<a href="<%= request.getContextPath() %>/handle/123456789/11" target="_blank" title="" class="color-info">
            <div class="col-lg-3 col-md-6 col-sm-6">
              <div class="text-center feature-block">
                <span class="fb-icon color-info">
                  <img src="image/documento.png"/>
                </span>
				<h3>Artículos Científicos</h3>
              </div>
            </div>
			</a>
			<a href="<%= request.getContextPath() %>/handle/123456789/14" target="_blank" title="" class="color-warning">
            <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="text-center feature-block">
                <span class="fb-icon color-warning">
                  <img src="image/libros-en-pila-de-tres.png"/>
                </span>
                <h3>Libros</h3>
              </div>
              </div>
			</a>
			  
			<a href="<%= request.getContextPath() %>/handle/123456789/12" target="_blank" title="" class="color-success ">
			<div class="col-lg-3 col-md-6 col-sm-6">
            <div class="text-center feature-block">
                <span class="fb-icon color-success">
                  <img src="image/libro-abierto-visto-de-arriba.png"/>
                </span>
                <h3>Capítulos de Libros</h3>
              </div>
            </div>
			</a>
            
			<a href="<%= request.getContextPath() %>/handle/123456789/1056" target="_blank" title="" class="color-danger ">
            <div class="col-lg-3 col-md-6 col-sm-6">
             <div class="text-center feature-block">
                <span class="fb-icon color-danger">
                  <img src="image/tesis.png"/>
                </span>
                <h3>Tesis de Posgrado</h>
              </div>
            </div>
			</a>
            </div>          
</div>  
<hr>
<div class="blog-section paddingTB60 ">
<div class="container">
	<div class="row">
		<div class="site-heading text-center">
			<h3>Noticias</h3>
			<p>Conoce nuestro canal de Youtube y nuestra página de Facebook</p>
			<div class="border"></div>
		</div>
		
		<div class="col-sm-5 col-md-1">
	    </div> <!-- End Col -->	
	    <div class="col-sm-5">
			<div class="youtube-player" data-id="9dBwacffHnw"></div>
			<div>
				<h4 align="center">Nuestro canal:<a href="https://www.youtube.com/channel/UCbJ4U3RAv3O_Vezz71Tyn0Q?view_as=subscriber" target="_blank"> Repositorio Institucional Aramara</a></h4>
			</div>
		</div> <!-- End Col -->							
		<div class="col-sm-5">
			<div class="fb-page" data-href="https://www.facebook.com/AramaraRI/" data-tabs="timeline,events,messages" data-width="320" data-height="480" data-small-header="true" data-adapt-container-width="true" data-hide-cover="true" data-show-facepile="true">
				<blockquote cite="https://www.facebook.com/AramaraRI/" class="fb-xfbml-parse-ignore">
					<a href="https://www.facebook.com/AramaraRI/">Repositorio Institucional Aramara - UAN</a>
				</blockquote>
			</div>
		</div> <!-- End Col -->	
</div>
</div>
</div>
<hr>
<div class="container">
	<div class="row">
		<div class="site-heading text-center">
			<h3>Estadísticas</h3>
			<p>Conoce nuestras estadísticas</p>
			<div class="border"></div>
			<div class="row">
  <div class="col-md-6" style="border: solid; border-width: 1px; border-color: gray; border-radius: 6px; padding-left: 3em; padding-right: 3em;">
	<h2>Lo más visitado</h2>
    <canvas id="grafica1"></canvas>
  <script>
  var ctx = document.getElementById('grafica1').getContext('2d');
  ctx.canvas.width = 500;
  ctx.canvas.height = 279;
  var grafica1 = new Chart(ctx, {
      type: 'bar',
      data: {
          labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
          datasets: [{
              label: 'Vistas',
              data: [12, 19, 3, 5, 5, 3],
              backgroundColor: [
                  'rgba(255, 99, 132, 1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(255, 206, 86, 1)',
                  'rgba(75, 192, 192, 1)',
                  'rgba(153, 102, 255,1)',
                  'rgba(255, 159, 64, 1)'
              ],
              borderColor: [
                  'rgba(255, 99, 132, 1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(255, 206, 86, 1)',
                  'rgba(75, 192, 192, 1)',
                  'rgba(153, 102, 255, 1)',
                  'rgba(255, 159, 64, 1)'
              ],
              borderWidth: 1
          }]
      }
  });
  </script>
  <br>
  </div>
  <div class="col-md-6">
  <div class="row">
  <div class="col-md-6" style="border: solid; border-width: 1px; border-color: gray; border-radius: 6px; padding-left: 3em; padding-right: 3em;">
	<h4>Autores más visitados &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4>
    <canvas id="grafica2" ></canvas>
  <script>
  var ctx = document.getElementById('grafica2').getContext('2d');
  ctx.canvas.width = 320;
  ctx.canvas.height = 434;
  var grafica2 = new Chart(ctx, {
      type: 'doughnut',
      data: {
          labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
          datasets: [{
              label: '# of Votes',
              data: [12, 19, 3, 5, 2, 3],
              backgroundColor: [
                  'rgba(255, 99, 132, 1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(255, 206, 86, 1)',
                  'rgba(75, 192, 192, 1)',
                  'rgba(153, 102, 255,1)',
                  'rgba(255, 159, 64, 1)'
              ],
              borderColor: [
                  'rgba(255, 99, 132, 1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(255, 206, 86, 1)',
                  'rgba(75, 192, 192, 1)',
                  'rgba(153, 102, 255, 1)',
                  'rgba(255, 159, 64, 1)'
              ],
              borderWidth: 1
          }]
      }
  });
  </script>
    <br>
  </div>

  <div class="col-md-6" style="border: solid; border-width: 1px; border-color: gray; border-radius: 6px; padding-left: 3em; padding-right: 3em;">
  <h4>Publicaciones más visitadas</h4>
    <canvas id="grafica3"></canvas>
  <script>
  var ctx = document.getElementById('grafica3').getContext('2d');
  ctx.canvas.width = 320;
  ctx.canvas.height = 434;
  var grafica3 = new Chart(ctx, {
      type: 'doughnut',
      data: {
          labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
          datasets: [{
              label: '# of Votes',
              data: [12, 19, 3, 5, 2, 3],
              backgroundColor: [
                  'rgba(255, 99, 132, 1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(255, 206, 86, 1)',
                  'rgba(75, 192, 192, 1)',
                  'rgba(153, 102, 255,1)',
                  'rgba(255, 159, 64, 1)'
              ],
              borderColor: [
                  'rgba(255, 99, 132, 1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(255, 206, 86, 1)',
                  'rgba(75, 192, 192, 1)',
                  'rgba(153, 102, 255, 1)',
                  'rgba(255, 159, 64, 1)'
              ],
              borderWidth: 1
          }]
      }
  });
  </script>
  <br>
  </div>
  </div>
  </div>
  </div>
			
		</div>
</div>
</div>	
<style>
.img-aum:hover{
	transform: scale(1.3);
}
.img-aum{
	z-index: 90;
}
</style>
<div class="row">
		<div class="col-md-2 col-md-offset-1" align="center">
		<a href="https://orcid.org/" target="_blank" title="Open Researcher and Contributor ID">
		<img alt="Logo" class="img-responsive img-aum" src="/image/IDorcid-logo.png" style="max-height: 320px" /> 		
		</a>
		</div>
		<div class="col-md-2" align="center">
		<a href="https://scholar.google.com.mx/" target="_blank" title="Google Académico">
		<img alt="Logo" class="img-responsive img-aum" src="/image/googleacademico-logo.png" style="max-height: 256px" /> 		
		</a>
		</div>
		<div class="col-md-2" align="center">
		<a href="https://creativecommons.org/" target="_blank" title="Creative Commons">
		<img alt="Logo" class="img-responsive img-aum" src="/image/creative-commons-.png" style="max-height: 256px"  /> 		
		</a>
		</div>
		<div class="col-md-2" align="center">
		<a href="http://www.remeri.org.mx/portal/index.html" target="_blank" title="Red Mexicana de Repositorios Institucionales">
		<img alt="Logo" class="img-responsive img-aum" src="/image/remeri.png"/> 		
		</a>
		</div>
		<div class="col-md-2" align="center">
		<a href="https://www.researchgate.net/" target="_blank" title="Research Gate">
		<img alt="Logo" class="img-responsive img-aum" src="/image/researchgate.png" style="max-height: 256px"  /> 		
		</a>
		</div>
	</div>
	<div class="row">
		<div class="col-md-2 col-md-offset-1" align="center">
		<a href="http://sherpa.ac.uk/romeo/index.php?la=es" target="_blank" title="SHERPA/RoMEO">
		<img alt="Logo" class="img-responsive img-aum" src="/image/sherparomeo-logo.png" style="max-height: 320px" /> 		
		</a>
		</div>
		<div class="col-md-2" align="center">
		<a href="http://www.lareferencia.info/es/" target="_blank" title="La Referencia">
		<img alt="Logo" class="img-responsive img-aum" src="/image/Lareferencia-logo.png" style="max-height: 256px" /> 		
		</a>
		</div>
		<div class="col-md-2" align="center">
		<a href="https://www.academia.edu/" target="_blank" title="Academia.edu">
		<img alt="Logo" class="img-responsive img-aum" src="/image/academia.edu.png" style="max-height: 256px"  /> 		
		</a>
		</div>
		<div class="col-md-2" align="center">
		<a href="https://www.openaccess.nl/" target="_blank" title="Open Access">
		<img alt="Logo" class="img-responsive img-aum" src="/image/open.access.png"/> 		
		</a>
		</div>
		<div class="col-md-2" align="center">
		<a href="http://riacti.uanl.mx/" target="_blank" title="Dirección de Educación Digital">
		<img alt="Logo" class="img-responsive img-aum" src="/image/direccion-digital.png" style="max-height: 256px"  /> 		
		</a>
		</div>
	</div>

<div class="container row">
<%
if (communities != null && communities.length != 0)
{
%>
	<div class="col-md-4">		
               <h3><fmt:message key="jsp.home.com1"/></h3>
                <p><fmt:message key="jsp.home.com2"/></p>
				<div class="list-group">
<%
	boolean showLogos = ConfigurationManager.getBooleanProperty("jspui.home-page.logos", true);
    for (int i = 0; i < communities.length; i++)
    {
%><div class="list-group-item row">
<%  
		Bitstream logo = communities[i].getLogo();
		if (showLogos && logo != null) { %>
	<div class="col-md-3">
        <img alt="Logo" class="img-responsive" src="<%= request.getContextPath() %>/retrieve/<%= logo.getID() %>" /> 
	</div>
	<div class="col-md-9">
<% } else { %>
	<div class="col-md-12">
<% }  %>		
		<h4 class="list-group-item-heading"><a href="<%= request.getContextPath() %>/handle/<%= communities[i].getHandle() %>"><%= communities[i].getMetadata("name") %></a>
<%
        if (ConfigurationManager.getBooleanProperty("webui.strengths.show"))
        {
%>
		<span class="badge pull-right"><%= ic.getCount(communities[i]) %></span>
<%
        }

%>
		</h4>
		<p><%= communities[i].getMetadata("short_description") %></p>
    </div>
</div>                            
<%
    }
%>
	</div>
	</div>
<%
}
%>
	<%
    	int discovery_panel_cols = 8;
    	int discovery_facet_cols = 4;
    %>
	<%@ include file="discovery/static-sidebar-facet.jsp" %>
</div>

<div class="row">
	<%@ include file="discovery/static-tagcloud-facet.jsp" %>
</div>
	
</div>
</dspace:layout>
