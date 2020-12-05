package com.pistamed.control;

import com.pistamed.conexion.Conexion;
import com.pistamed.conexion.ConexionPool;
import com.pistamed.entidad.*;
import com.pistamed.operaciones.Operaciones;
import com.pistamed.utilerias.Tabla;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Productos", urlPatterns = {"/Productos"})
public class Productos extends HttpServlet {
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter io = response.getWriter();
        String accion = request.getParameter("accion");
        if(accion==null) {
            if(request.getSession().getAttribute("resultado")!=null) {
                request.setAttribute("resultado", request.getSession().getAttribute("resultado"));
                request.getSession().removeAttribute("resultado");
            }
            try {
                Conexion conn = new ConexionPool();
                conn.conectar();
                Operaciones.abrirConexion(conn);
                Operaciones.iniciarTransaccion();
                String sql = "";
                if(request.getParameter("txtBusqueda")!=null) {
                    sql = "select idproducto, nombre, precio, FORMAT(fechavencimiento, 'dd/MM/yyyy HH:mm', 'en-US') as date, existencia, idcategoria, idpresentacion from producto where nombre like ?";
                } else {
                    sql = "select idproducto, nombre, precio, FORMAT(fechavencimiento, 'dd/MM/yyyy HH:mm', 'en-US') as date, existencia, idcategoria, idpresentacion from producto";
                }
                String[][] producto = null;
                if(request.getParameter("txtBusqueda")!=null) {
                    List<Object> params = new ArrayList<>();
                    params.add("%"+request.getParameter("txtBusqueda").toString()+"%");
                    producto = Operaciones.consultar(sql, params);
                } else {
                    producto = Operaciones.consultar(sql, null);
                }
                //declaracion de cabeceras a usar en la tabla HTML
                String[] cabeceras = new String[]{
                    "ID Producto",
                    "Nombre",
                    "Precio",
                    "Vencimiento",
                    "Existencia",
                    "Categoria",
                    "Presentacion"
                };
                //variable de tipo Tabla para generar la Tabla HTML
                Tabla tab = new Tabla(producto, //array que contiene los datos
                "75%", //ancho de la tabla px | %
                Tabla.STYLE.TABLE01, //estilo de la tabla
                Tabla.ALIGN.LEFT, // alineacion de la tabla
                cabeceras); //array con las cabeceras de la tabla
                //boton eliminar
                tab.setEliminable(true);
                //boton actualizar
                tab.setModificable(true);
                //url del proyecto
                tab.setPageContext(request.getContextPath());
                //pagina encargada de eliminar
                tab.setPaginaEliminable("/Productos?accion=eliminar");
                //pagina encargada de actualizacion
                tab.setPaginaModificable("/Productos?accion=modificar");
                //pagina encargada de seleccion para operaciones
                tab.setPaginaSeleccionable("/Productos?accion=modificar");
                //icono para modificar y eliminar
                tab.setIconoModificable("/iconos/edit.png");
                tab.setIconoEliminable("/iconos/delete.png");
                //columnas seleccionables
                tab.setColumnasSeleccionables(new int[]{1});
                //pie de tabla
                tab.setPie("Resultado Productos");
                //imprime la tabla en pantalla
                String tabla01 = tab.getTabla();
                
                request.setAttribute("tabla", tabla01);
                request.setAttribute("valor", request.getParameter("txtBusqueda"));
                request.getRequestDispatcher("productos/productos_consulta.jsp").forward(request, response);
            } catch(Exception ex) {
                try {
                    Operaciones.rollback();
                } catch (SQLException ex1) {
                    Logger.getLogger(Productos.class.getName()).log(Level.SEVERE, null, ex1);
                }
            } finally {
                try {
                    Operaciones.cerrarConexion();
                } catch (SQLException ex) {
                    Logger.getLogger(Productos.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //request.getRequestDispatcher("productos/productos_consulta.jsp").forward(request, response);
        }else if(accion.equals("listado_categoria")){
            try{
                Conexion conn = new ConexionPool();
                conn.conectar();
                Operaciones.abrirConexion(conn);
                Operaciones.iniciarTransaccion();
                String sql = "select idcategoria, nombre from categoria";
                String[][] categorias = Operaciones.consultar(sql, null);
                String[] cabeceras = new String[]{
                    "Id Categoria",
                    "Nombre",
                };
                //variable de tipo Tabla para generar la Tabla HTML
                Tabla tab = new Tabla(categorias, //array que contiene los datos
                "100%", //ancho de la tabla px | %
                Tabla.STYLE.TABLE01, //estilo de la tabla
                Tabla.ALIGN.LEFT, // alineacion de la tabla
                cabeceras); //array con las cabeceras de la tabla
                tab.setMetodoFilaSeleccionable("_Seleccionar_");
                //url del proyecto
                tab.setPageContext(request.getContextPath());
                tab.setFilaSeleccionable(true);
                //icono para modificar y eliminar
                tab.setIconoModificable("/iconos/edit.png");
                tab.setIconoEliminable("/iconos/delete.png");
                //columnas seleccionables
                tab.setColumnasSeleccionables(new int[]{1});
                //pie de tabla
                tab.setPie("Resultado Categorias");
                //imprime la tabla en pantalla
                String tabla01="No hay datos";
                if (categorias!=null)
                    tabla01= tab.getTabla();
                request.setAttribute("tabla", tabla01);
                request.getRequestDispatcher("productos/categorias.jsp").forward(request,
                response);
            }
        catch(Exception ex) {
                try {
                    Operaciones.rollback();
                } catch (SQLException ex1) {
                    Logger.getLogger(Productos.class.getName()).log(Level.SEVERE, null, ex1);
                }
            } finally {
                try {
                    Operaciones.cerrarConexion();
                } catch (SQLException ex) {
                    Logger.getLogger(Productos.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
    }else if(accion.equals("listado_presentacion")){
            try{
                Conexion conn = new ConexionPool();
                conn.conectar();
                Operaciones.abrirConexion(conn);
                Operaciones.iniciarTransaccion();
                String sql = "select idpresentacion, nombre from presentacion";
                String[][] presentaciones = Operaciones.consultar(sql, null);
                String[] cabeceras = new String[]{
                    "Id Presentacion",
                    "Nombre",
                };
                //variable de tipo Tabla para generar la Tabla HTML
                Tabla tab = new Tabla(presentaciones, //array que contiene los datos
                "100%", //ancho de la tabla px | %
                Tabla.STYLE.TABLE01, //estilo de la tabla
                Tabla.ALIGN.LEFT, // alineacion de la tabla
                cabeceras); //array con las cabeceras de la tabla
                tab.setMetodoFilaSeleccionable("_Seleccionar_");
                //url del proyecto
                tab.setPageContext(request.getContextPath());
                tab.setFilaSeleccionable(true);
                //icono para modificar y eliminar
                // tab.setIconoModificable("/iconos/edit.png");
                // tab.setIconoEliminable("/iconos/delete.png");
                //columnas seleccionables
                tab.setColumnasSeleccionables(new int[]{1});
                //pie de tabla
                tab.setPie("Resultado Categorias");
                //imprime la tabla en pantalla
                String tabla01="No hay datos";
                if (presentaciones!=null)
                    tabla01= tab.getTabla();
                request.setAttribute("tabla", tabla01);
                request.getRequestDispatcher("productos/presentaciones.jsp").forward(request,
                response);
            }
        catch(Exception ex) {
                try {
                    Operaciones.rollback();
                } catch (SQLException ex1) {
                    Logger.getLogger(Productos.class.getName()).log(Level.SEVERE, null, ex1);
                }
            } finally {
                try {
                    Operaciones.cerrarConexion();
                } catch (SQLException ex) {
                    Logger.getLogger(Productos.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
    }else if(accion.equals("insertar")) {
            request.getRequestDispatcher("productos/insertar_modificar.jsp").forward(request, response);
        } else if(accion.equals("modificar")) {
            try {
                Conexion conn = new ConexionPool();
                conn.conectar();
                Operaciones.abrirConexion(conn);
                Operaciones.iniciarTransaccion();
                
                Producto p = Operaciones.get(request.getParameter("id"), new Producto());
                request.setAttribute("producto", p);
                
                /*String sqlcategoria = "select * from categoria";
                List<Categoria> listaCategoria = new ArrayList();
                String[][] rscat = Operaciones.consultar(sqlcategoria, new ArrayList());
                for(int i=0; i<rscat[0].length; i++){
                    Categoria c = new Categoria(Integer.parseInt(rscat[0][i]), rscat[1][i]);
                    listaCategoria.add(c);
                }
                request.setAttribute("Categoria", listaCategoria);
                
                String sqlpresentacion = "select * from presentacion";
                List<Presentacion> listaPresentacion = new ArrayList();
                String[][] rspre = Operaciones.consultar(sqlpresentacion, new ArrayList());
                for(int i=0; i<rspre[0].length; i++){
                    Presentacion ps = new Presentacion(Integer.parseInt(rspre[0][i]), rspre[1][i]);
                    listaPresentacion.add(ps);
                }
                request.setAttribute("Presentacion", listaPresentacion);*/
                
                Operaciones.commit();
            } catch(Exception ex) {
                try {
                    Operaciones.rollback();
                } catch (SQLException ex1) {
                    Logger.getLogger(Productos.class.getName()).log(Level.SEVERE, null, ex1);
                }
            } finally {
                try {
                    Operaciones.cerrarConexion();
                } catch (SQLException ex) {
                    Logger.getLogger(Productos.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } else if(accion.equals("eliminar")) {
            try {
                Conexion conn = new ConexionPool();
                conn.conectar();
                Operaciones.abrirConexion(conn);
                Operaciones.iniciarTransaccion();
                
                Producto p = Operaciones.eliminar(request.getParameter("id"), new Producto());
                if(p.getIdproducto()!=0) {
                    request.getSession().setAttribute("resultado", 1);
                } else {
                    request.getSession().setAttribute("resultado", 0);
                }
                Operaciones.commit();
            } catch(Exception ex) {
                try {
                    Operaciones.rollback();
                } catch (SQLException ex1) {
                    Logger.getLogger(Productos.class.getName()).log(Level.SEVERE, null, ex1);
                }
                request.getSession().setAttribute("resultado", 0);
            } finally {
                try {
                    Operaciones.cerrarConexion();
                } catch (SQLException ex) {
                    Logger.getLogger(Productos.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            response.sendRedirect(request.getContextPath()+"/Productos");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter io = response.getWriter();
        String accion = request.getParameter("accion");
        switch(accion) {
            case "insertar_modificar": {
                String idProducto = request.getParameter("txtIdproducto");
                String nombre = request.getParameter("txtNombre");
                String precio = request.getParameter("txtPrecio");
                String fecha = request.getParameter("txtFecha"); 
                String existencia = request.getParameter("txtExistencia");
                int idCat = Integer.parseInt(request.getParameter("txtIdcategoria"));
                int idPre = Integer.parseInt(request.getParameter("txtIdpresentacion"));
                try {
                    Conexion conn = new ConexionPool();
                    conn.conectar();
                    Operaciones.abrirConexion(conn);
                    Operaciones.iniciarTransaccion();
                    Date date = new SimpleDateFormat("dd/MM/yyyy HH:mm").parse(fecha);
                    if(idProducto != null && !idProducto.equals("")) {
                        Producto p = new Producto(Integer.parseInt(idProducto),nombre,Double.parseDouble(precio), new Timestamp(date.getTime()), Integer.parseInt(existencia), idCat, idPre);
                        p = Operaciones.actualizar(p.getIdproducto(), p);
                        if(p.getIdproducto() != 0) {
                            request.getSession().setAttribute("resultado", 1);
                        } else {
                            request.getSession().setAttribute("resultado", 0);
                        }
                    } else {
                        Producto p = new Producto();
                        p.setNombre(nombre);
                        p.setPrecio(Double.parseDouble(precio));
                        p.setFechavencimiento(new Timestamp(date.getTime()));
                        p.setExistencia(Integer.parseInt(existencia));
                        p.setIdcategoria(idCat);
                        p.setIdpresentacion(idPre);
                        p = Operaciones.insertar(p);
                        if(p.getIdproducto() != 0) {
                            request.getSession().setAttribute("resultado", 1);
                        } else {
                            request.getSession().setAttribute("resultado", 0);
                        }
                    }
                    Operaciones.commit();
                } catch(Exception ex) {
                    io.println(ex.getMessage());
                try {
                    Operaciones.rollback();
                } catch (SQLException ex1) {
                    Logger.getLogger(Productos.class.getName()).log(Level.SEVERE, null, ex1);
                }
                request.getSession().setAttribute("resultado", 2);
                ex.printStackTrace();
                } finally {
                    try {
                        Operaciones.cerrarConexion();
                    } catch (SQLException ex) {
                        Logger.getLogger(Productos.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                response.sendRedirect(request.getContextPath() + "/Productos");
                break;
            }
            case "eliminar": {
            break;
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
