<%@page import="com.pistamed.entidad.Presentacion"%>
<%@page import="com.pistamed.operaciones.Operaciones"%>
<%@page import="com.pistamed.conexion.*" %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Test Eliminar</h1>
        <%
            try {
                ConexionPool con = new ConexionPool(); // inicializamos el pool deconexiones
                con.conectar();
                Presentacion a = new Presentacion(); // creamos la entidad Presentacion
                Operaciones.abrirConexion(con); // abrimos la conexión de la bd
                Operaciones.iniciarTransaccion(); // iniciamos la transacción
                a = Operaciones.eliminar(1, new Presentacion()); // eliminamos la entidad presentacion en la bd
                // el método eliminar retorna la entidad que acabamos de eliminar
                Operaciones.commit(); // confirmamos los cambios de la transacción
            } catch (Exception ex) {
                throw ex;
                //Logger.getLogger(Principal.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                try {
                    Operaciones.cerrarConexion(); // se cierra la conexión al final de todo
                } catch (SQLException ex) {
                    throw ex;
                    //Logger.getLogger(Principal.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        %>
    </body>
</html>
