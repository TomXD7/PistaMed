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
        <h1>Test Actualizacion</h1>
        <%
            try {
                ConexionPool con = new ConexionPool(); // inicializamos el pool deconexiones
                con.conectar();
                Presentacion p = new Presentacion(); // creamos la entidad Presentacion
                p.setPresentacion("Efervecente"); // definimos la nueva presentacion
                Operaciones.abrirConexion(con); // abrimos la conexión de la bd
                Operaciones.iniciarTransaccion(); // iniciamos la transacción
                // pasamos el id del registro de la bd que queremos actualizar,
                // y luego pasamos la entidad presentacion que queremos actualizar
                p = Operaciones.actualizar(1, p); // actualizamos la entidad presentacion enla bd
                // el método actualizar retorna la entidad con todos los campos actualizados
                out.print("La nueva presentacion es: " + p.getPresentacion());
                Operaciones.commit(); // confirmamos los cambios de la transacción
            } catch (Exception ex) {
                throw ex;
                //Logger.getLogger(Principal.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                try {
                    Operaciones.cerrarConexion(); // se cierra la conexión al final detodo
                } catch (SQLException ex) {
                    throw ex;
                    //Logger.getLogger(Principal.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        %>
    </body>
</html>
