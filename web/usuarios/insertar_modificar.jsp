<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../_top.jsp"%>
<h1>Usuarios</h1>
<br/>
<form name="form_usuarios" onsubmit="return validar();"
      action="${pageContext.servletContext.contextPath}/Usuarios?accion=insertar_modificar"
      method="POST">
    <table border="0" id="table">
        <thead>
            <tr>
                <th colspan="">Complete la información<br><br></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>ID Usuario</td>
                <td><input type="text" name="txtIdusuario" value="${usuario.idusuario}" ${readonly} /></td>
            </tr>
            <tr>
                <td>Nombres</td>
                <td><input type="text" name="txtNombres" value="${usuario.nombres}"/></td>
            </tr>
            <tr>
                <td>Apellidos</td>
                <td><input type="text" name="txtApellidos" id="txtPais" value="${usuario.apellidos}" /></td>
            </tr>
            <tr>
                <td>Correo</td>
                <td><input type="text" name="txtEmail" id="txtPais" value="${usuario.correo}" /></td>
            </tr>
            <tr>
                <td>Clave</td>
                <td><input type="text" name="txtClave" id="txtPais" value="${usuario.clave}" /></td>
            </tr>
            <tr>
                <td>Rol</td>
                <td>
                    <select name="cmbRoles">
                        <c:forEach var="rol" items="${Roles}">
                            <option value="${rol.idrol}">${rol.rol}</option>
                        </c:forEach>
                    </select>
                </td>
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
        var pais = document.getElementById('txtPais');
        if (pais.value.length == 0) {
            pais.focus();
            alert("Digite nombre del país");
            return false;
        }
        return true;
    }
</script>
<%@include file="../_down.jsp"%>
