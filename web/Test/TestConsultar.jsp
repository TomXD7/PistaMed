<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
        <h1>Test Consulta a varias tablas</h1>
        <%
            try {
                ConexionPool con = new ConexionPool(); // inicializamos el pool deconexiones
                con.conectar();
                Operaciones.abrirConexion(con); // abrimos la conexión de la bd
                String consulta = "SELECT pd.nombre, c.nombre, ps.nombre, pd.precio, pd.fechavencimiento from producto as pd\n"
                        + " inner join presentacion as ps on ps.idpresentacion = pd.idpresentacion\n"
                        + " inner join categoria as c on c.idcategoria = pd.idcategoria"
                        + " where c.nombre = ? and ps.nombre = ?;"; //consulta SQL
                List<Object> params = new ArrayList();
                params.add("Antibiotico");
                params.add("Jarabe");
                String[][] listado = Operaciones.consultar(consulta, params); //obtenemos los registros de la consulta
                // el método consultar retorna todos los registros de la consulta
                // NOTA: Si la consulta no recibe parámetros entonces el segundoparámetro
                // del método consultar debe ser null.
                // El método consultar retorna null si no encuentra ningún registro dela búsqueda
                for(int j=0; j<listado[0].length;j++){
                    for(int i=0; i<listado.length; i++){
                        out.print(listado[i][j] + ", ");
                    }
                    out.print("<br>");
                }
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
