<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../_top.jsp"%>
<h1>Categorias</h1>
<br/>
<form name="form_roles" onsubmit="return validar();"
      action="${pageContext.servletContext.contextPath}/Categorias?accion=insertar_modificar"
      method="POST">
    <table border="0" id="table">
        <thead>
            <tr>
                <th colspan="">Complete la informaci�n<br><br></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>ID Categoria</td>
                <td><input type="text" name="txtIdcategoria" value="${categoria.idcategoria}" readonly="readonly" /></td>
            </tr>
            <tr>
                <td>Nombre</td>
                <td><input type="text" name="txtNombre" id="txtPais" value="${categoria.nombre}" /></td>
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
        if (pais.value.length === 0) {
            pais.focus();
            alert("Digite el nombre");
            return false;
        }
        return true;
    }
</script>
<%@include file="../_down.jsp"%>