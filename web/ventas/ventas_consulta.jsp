<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../_top.jsp"%>
<script>
    function abrirVentana(URL) {
        //funcion javascript para abrir un subventana para realizar
        //busquedas, se le pasa la pagina a mostrar como parametro

        window.open(URL, "ventana1", "width=700,height=400,scrollbars=YES,statusbar=YES,top=150,left=300")
    }
</script>
<h1>Ventas</h1><br><br>
<form name="main" method="post"
      action="${pageContext.servletContext.contextPath}/Ventas">
    <!--<input type="hidden" name="sw_nuevo" value="1"/>-->
    <br>
    Seleccione Productos
    <input type="text" id="txtIdorigen" name="txtIdorigen" value="${idorigen}" size="3"
           readonly="readonly">
    <input type="text" id="txtOrigen" name="txtOrigen" size="50" value="${origen}"
           readonly="readonly">
    <input type="button" class="boton" value="..."
           onclick="abrirVentana('${pageContext.servletContext.contextPath}/Ventas?accion=listado_productos');">
    <input type="submit" value="Agregar" class="boton">
</form><br><br>
<c:if test="${resultado!=null}">
    <c:if test="${resultado==1}">
        <p style="color:darkgreen; font-size: 15px; text-align: center"><strong>Operación realizada
                correctamente.</strong></p>
            </c:if>
            <c:if test="${resultado==0}">
        <p style="color:darkred; font-size: 15px; text-align: center"><strong>La operación no se
                realizó.</strong></p>
            </c:if>
        </c:if>
        ${tabla}
<script>
    window.onload = function () {
//inicializamos el control de fecha
        var dtp = new DateTimePicker('.datepicker', {
            timePicker: true, // activamos la selección de hora
            format: 'd/m/Y H:i' //formato de fecha y hora
        });
    };
//funcion que se llamará al seleccionar el origen desde la ventana
    function setDataOrigen(idorigen, origen) {
        document.getElementById("txtIdorigen").value = idorigen;
        document.getElementById("txtOrigen").value = origen;
    }
</script>
<%@include file="../_down.jsp"%>