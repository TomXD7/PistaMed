<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/estilos.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PistaMed</title>
    </head>
    <body>
        <div class="header">
            <img src="img/logo.png" alt="">
        </div>
        <div class="menu navegadorcito">
                <img src="img/pistachos_nav.jpg" alt="">
        </div>
        <div class="content row">
            
            <div class="index">
                <h2 class="indi">Inicio de Sesión</h2><br>
                <center>
                    <c:if test="${error!=null}">
                        <c:if test="${error==2}">
                            <p><strong style="color:red">Usuario y/o contraseña incorrectos</strong></p>
                        </c:if>
                    </c:if>
                </center>   
                <form name="main" action="Login?accion=login" method="POST">
                    <table>
                        <tr><td>Usuario:</td></tr>
                        <tr><td><input type="text" name="txtUsuario" size="30px" /></td></tr>
                        <tr><td>Contraseña:</td></tr>
                        <tr><td><input type="password" name="txtClave" size="30px" /></td></tr>
                        <tr><td>
                                <div>
                                    <ul>
                                        <li><input id="boton" type="submit" value="Entrar" name="btnEntrar"/></li>
                                    </ul>
                                </div>
                            </td></tr>
                    </table>  
                </form>
            </div>
        </div>
        <footer>
            <div class="row">
               
                <p>&copy; Copyright 2020 | Design & Developed by: Pistachos sin sal</p>
                <hr>
                <p class="fot">Universidad de Sonsonate</p>  
                
            </div>
        </footer>
    </body>
</html>