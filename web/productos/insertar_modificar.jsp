<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../_top.jsp"%>
<script>
    function abrirVentana(URL) {
//funcion javascript para abrir un subventana para realizar
//busquedas, se le pasa la pagina a mostrar como parametro
        window.open(URL, "ventana1", "width=700,height=400,scrollbars=YES,statusbar=YES,top=150,left=300")
    }
</script>
<h1>Productos</h1>
<br/>
<form name="form_productos" onsubmit="return validar();"
      action="${pageContext.servletContext.contextPath}/Productos?accion=insertar_modificar"
      method="POST">
    <table border="0" id="table">
        <thead>
            <tr>
                <th colspan="">Complete la información<br><br></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>ID Producto</td>
                <td><input type="text" name="txtIdproducto" value="${producto.idproducto}" /></td>
            </tr>
            <tr>
                <td>Nombres</td>
                <td><input type="text" name="txtNombre" value="${producto.nombre}"/></td>
            </tr>
            <tr>
                <td>Precio</td>
                <td><input type="text" name="txtPrecio" value="${producto.precio}"/></td>
            </tr>
            <tr>
                <td>Fecha de Vencimiento</td>
                <td><input class="datepicker" type="text" name="txtFecha" size="25"></td>
            </tr>
            <tr>
                <td>Existencia</td>
                <td><input type="text" name="txtExistencia" id="txtPais" value="${producto.existencia}" /></td>
            </tr>
            <tr>
                <td>Categoria</td>
                <td>
                    <input type="text" name="txtIdcategoria" id="txtIdcategoria" size="2" readonly="readonly">
                    <input type="text" name="txtCategoria" id="txtCategoria" readonly="readonly">
                    <input type="button" value="..." class="boton" onclick="abrirVentana('${pageContext.servletContext.contextPath}/Productos?accion=listado_categoria');">
                </td>
            </tr>
            <tr>
                <td>Presentacion</td>
                <td>
                    <input type="text" name="txtIdpresentacion" id="txtIdpresentacion" size="2" readonly="readonly">
                    <input type="text" name="txtPresentacion" id="txtPresentacion" readonly="readonly">
                    <input type="button" value="..." class="boton" onclick="abrirVentana('${pageContext.servletContext.contextPath}/Productos?accion=listado_presentacion');">
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
    window.onload = function () {
        //inicializamos el control de fecha
        var dtp = new DateTimePicker('.datepicker', {
            timePicker: true, // activamos la selección de hora
            format: 'd/m/Y H:i' //formato de fecha y hora
        });
    };
    function setDataCate(idC, nombreC) {
        document.getElementById("txtIdcategoria").value = idC;
        document.getElementById("txtCategoria").value = nombreC;
    }
    //funcion que se llamará al seleccionar el destino desde la ventana
    function setDataPres(idP, nombreP) {
        document.getElementById("txtIdpresentacion").value = idP;
        document.getElementById("txtPresentacion").value = nombreP;
    }
</script>
<%@include file="../_down.jsp"%>
