<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Footer for home page
  --%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="java.net.URLEncoder" %>
<%@ page import="org.dspace.app.webui.util.UIUtil" %>

		
		<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
		<link rel="stylesheet" href="<%= request.getContextPath() %>/css/socialnetworks.css" type="text/css" />


<%
    String sidebar = (String) request.getAttribute("dspace.layout.sidebar");
%>

            <%-- Right-hand side bar if appropriate --%>
<%
    if (sidebar != null)
    {
%>
	</div>
	<div class="col-md-3">
                    <%= sidebar %>
    </div>
    </div>       
<%
    }
%>
</div>
</main>
            <%-- Page footer --%>
             <footer class="navbar navbar-inverse navbar-bottom">
				 <div class="col-md-12" align="center">
                    <ul class="social-network social-circle" >
						<h3 id="contacto">Contacto</h3>
                        <li><a href="http://dspace.uan.mx:8080/jspui/feed/rss_2.0/site" target="_blank" class="icoRss" title="Rss"><i class="fa fa-rss"></i></a></li>
                        <li><a href="https://www.facebook.com/AramaraRI/" target="_blank" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="https://twitter.com/AramaraRi" target="_blank" class="icoTwitter" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="https://www.instagram.com/aramarari/" target="_blank" class="icoInstagram" title="Instagram"><i class="fa fa-instagram"></i></a></li>
						<li><a href="mailto:aramara@uan.edu.mx" target="_blank" class="icoEnvelope" title="Correo"><i class="fa fa-envelope"></i></a></li>
                    </ul>
						<p id="info">UNIVERSIDAD AUTÓNOMA DE NAYARIT
						<br>
						Ciudad de la Cultura "Amado Nervo".
						<br>
						Tepic, Nayarit. México. C.P. 63155
						<br>
						Tel. (311) 211 8800.
						<br>
						<a href="mailto:contacto@uan.edu.mx" target="_blank" title="Correo">contacto@uan.edu.mx</a>
						<br>
						<a href="http://www.uan.edu.mx" target="_blank" >http://www.uan.edu.mx</a>
						<br>
						</p>
				</div>
				<br/>
			</footer>
    </body>
</html>