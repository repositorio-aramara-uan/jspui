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
             <footer class="navbar navbar-inverse navbar-bottom" id="contacto_ref">
			 <div class="row">
			 <div class="col-md-3">
				<a href="https://www.conacyt.gob.mx/" target="_blank" >
					<img src="/image/Logotipo_de_la_CONACYT.png" class="img-responsive" id="logo-conacyt" alt="Conacyt" />
				</a>
			 </div>
			 <div class="col-md-6" align="center">
                    <ul class="social-network social-circle" >
						<h3 id="contacto">Contacto</h3>
                        <!--Icon made by Freepik from www.flaticon.com -->
                        <li><a href="http://dspace.uan.mx:8080/jspui/feed/rss_2.0/site" target="_blank" class="icoRss giro-anim" title="Rss"><img src="image/rss.png"/></a></li>
                        <li><a href="https://www.facebook.com/AramaraRI/" target="_blank" class="icoFacebook giro-anim" title="Facebook"><img src="image/facebook.png"/></a></li>
                        <li><a href="https://twitter.com/AramaraRi" target="_blank" class="icoTwitter giro-anim" title="Twitter"><img src="image/twitter.png"/></a></li>
                        <li><a href="https://www.instagram.com/aramarari/" target="_blank" class="icoInstagram giro-anim" title="Instagram"><img src="image/instagram.png"/></a></li>
						<li><a href="mailto:aramara@uan.edu.mx" target="_blank" class="icoEnvelope giro-anim" title="Correo"><img src="image/email.png" /> </a></li>
                    </ul>
						<p id="info">UNIVERSIDAD AUTÓNOMA DE NAYARIT
						<br>
						Ciudad de la Cultura "Amado Nervo".
						<br>
						Tepic, Nayarit. México. C.P. 63155
						<br>
						Tel. (311) 211 8800 ext. 6751
						<br>
						<a href="mailto:aramara@uan.edu.mx" target="_blank" title="Correo">aramara@uan.edu.mx</a>
						<br>
						<a href="http://www.uan.edu.mx" target="_blank" >http://www.uan.edu.mx</a>
						<br>
						</p>
			 </div>
			 <div class="col-md-3">				
				<a href="http://www.uan.edu.mx" target="_blank" >
					<img src="/image/logoUAN.png" class="img-responsive" id="logo-uan" alt="UAN" />
				</a>
			 </div>
			 </div>
			 
			 </footer>
    </body>
</html>