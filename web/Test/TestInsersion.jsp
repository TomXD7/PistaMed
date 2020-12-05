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
        <h1>Test Insersion.</h1>
        <%
            try {
                ConexionPool con = new ConexionPool(); // inicializamos el pool de conexiones 
                con.conectar();
                Presentacion p = new Presentacion(); // creamos la entidad Presentacion
                p.setPresentacion("Blister");// definimos la presentacion del medicamento
                Operaciones.abrirConexion(con); // abrimos la conexión de la bd
                Operaciones.iniciarTransaccion(); // iniciamos la transacción
                p = Operaciones.insertar(p); // insertamos la entidad presentacion en la bd
                // el método insertar retorna la entidad que acabamos de insertar
                out.print("La llave generada es: " + p.getIdpresentacion());
                Operaciones.commit(); // confirmamos los cambios de la transacción
            } catch (Exception ex) {
                throw ex;
                //Logger.getLogger(Principal.class.getName()).log(Level.SEVERE, null,ex);
            } finally {
                try {
                    Operaciones.cerrarConexion(); // se cierra la conexión al final de todo
                } catch (SQLException ex) {
                    //Logger.getLogger(Principal.class.getName()).log(Level.SEVERE,null, ex);
                    throw ex;
                }
            }
        %>
    </body>
</html>
