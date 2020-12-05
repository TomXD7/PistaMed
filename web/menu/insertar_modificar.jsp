<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../_top.jsp"%>
<h1>Menu</h1>
<br/>
<form name="form_menu" onsubmit="return validar();"
      action="${pageContext.servletContext.contextPath}/Menus?accion=insertar_modificar"
      method="POST">
    <table border="0" id="table">
        <thead>
            <tr>
                <th colspan="">Complete la información<br><br></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>ID Menu</td>
                <td><input type="text" name="txtIdmenu" value="${menu.idmenu}" readonly="readonly" /></td>
            </tr>
            <tr>
                <td>Menu</td>
                <td><input type="text" name="txtMenu" id="txtPais" value="${menu.menu}" /></td>
            </tr>
            <tr>
                <td>URL</td>
                <td><input type="text" name="txtUrl" id="txtPais" value="${menu.url}" /></td>
            </tr>
            <tr>
                <td>ID Padre</td>
                <td><input type="text" name="txtIdpadre" id="txtPais" value="${menu.idpadre}" /></td>
            </tr>
        </tbody>
    </table>
    <br/>
    <div class="buttons">
        <ul>
            <li><input type="submit" value="Guardar" name="guardar"/></li>
            <li><a href="#" onclick="javascript: return window.history.back()">Regresar</a></li>
        </ul>
    </div>
</form>
<script>
    function validar() {
        var pais = document.getElementById('txtRol');
        if (pais.value.length === 0) {
            pais.focus();
            alert("Digite el rol");
            return false;
        }
        return true;
    }
</script>
<%@include file="../_down.jsp"%>