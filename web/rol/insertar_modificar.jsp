<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../_top.jsp"%>
<h1>Roles</h1>
<br/>
<form name="form_roles" onsubmit="return validar();"
      action="${pageContext.servletContext.contextPath}/Rol?accion=insertar_modificar"
      method="POST">
    <table border="0" id="table">
        <thead>
            <tr>
                <th colspan="">Complete la información<br><br></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>ID Rol</td>
                <td><input type="text" name="txtIdrol" value="${rol.idrol}" readonly="readonly" /></td>
            </tr>
            <tr>
                <td>Nombre Rol</td>
                <td><input type="text" name="txtRol" id="txtPais" value="${rol.rol}" /></td>
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