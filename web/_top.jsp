<%@page import="com.pistamed.entidad.Menu"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<% HttpSession sesion = request.getSession();
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    List<Menu> MenuPrincipal = (List<Menu>) sesion.getAttribute("MenuPrincipal");
    if (MenuPrincipal == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/estilos.css">
        <link rel="stylesheet" type="text/css" href="css/tabla.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="css/datetimepicker.css"/>
        <script type="text/javascript" src="js/datetimepicker.js"></script>
        <title>PistaMed</title>
    </head>
    <body>
        <div class="header">
            <img src="img/logo.png" alt="">
        </div>
        <div class="sesion">
            <h3>Usuario: <%= sesion.getAttribute("Nombre")%>
                <a href="Principal?accion=logout">Cerrar Sesión</a>
            </h3>
        </div>
        <div id="menu" class="menu">
            <ul>
                <c:forEach var="menu" items="${MenuPrincipal}">
                    <li>
                        <a href="${pageContext.servletContext.contextPath}${menu.url}?op=${menu.idmenu}">${menu.menu}</a>
                        <ul>
                            <c:forEach var="submenu" items="${Permisos}">
                                <c:if test="${submenu.idpadre != null}">
                                    <c:if test="${submenu.idpadre == menu.idmenu}">
                                        <li>
                                            <a href="${pageContext.servletContext.contextPath}${submenu.url}?op=${submenu.idmenu}">${submenu.menu}</a>
                                        </li>
                                    </c:if>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </li>
                </c:forEach>
            </ul>
        </div>