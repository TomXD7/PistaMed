<%@page import="com.aerolinea.operaciones.Operaciones"%>
<%@page import="com.aerolinea.entidad.Usuario"%>
<%@page import="com.aerolinea.operaciones.ManejadorSentencias"%>
<%@page import="com.aerolinea.conexion.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
        Conexion con = new ConexionPool();
        con.conectar();
        if (con.getConexion()==null)
            out.println("Fallo la conexion");
        else
            out.println("Conexion exitosa");
        
        Usuario u = new Usuario("juan.perez", 
                "juan", 
                "perez", 
                "juan@aerolinea.com", 
                "111111111", 
                "admin", 
                1, 
                1);
        /*ManejadorSentencias mansen = new ManejadorSentencias(u);
        out.print(mansen.getSelect()+"<br>");
        out.print(mansen.getSelectAll()+"<br>");
        out.print(mansen.getInsert()+"<br>");
        out.print(mansen.getDelete()+"<br>");
        out.print(mansen.getUpdate()+"<br>");*/
        
        Operaciones.abrirConexion(con);
        Operaciones.iniciarTransaccion();
        try{
        Usuario usuarioInsertado = Operaciones.insertar(u);
        if (usuarioInsertado!=null){
            out.println("usuario insertado");
            out.println(u);
        }
        else
            out.println("error al insertar");
        
        Operaciones.commit();
        }catch(Exception e){
            Operaciones.rollback();
        }
        
        con.desconectar();
        %>
    </body>
</html>
