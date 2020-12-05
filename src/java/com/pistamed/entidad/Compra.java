package com.pistamed.entidad;
import com.pistamed.anotaciones.*;
import java.util.Date;

@Entity(table = "compra")
public class Compra {
    @PrimaryKey
    @AutoIncrement
    @NotNull
    private int idcompra;
    @NotNull
    private Date fecha;
    @NotNull
    private int idproveedor;
    @NotNull
    private int iddetallecompra;
    @NotNull
    private String idusuario;

    public Compra() {
    }

    public Compra(int idcompra, Date fecha, int idproveedor, int iddetallecompra, String idusuario) {
        this.idcompra = idcompra;
        this.fecha = fecha;
        this.idproveedor = idproveedor;
        this.iddetallecompra = iddetallecompra;
        this.idusuario = idusuario;
    }

    public int getIdcompra() {
        return idcompra;
    }

    public void setIdcompra(int idcompra) {
        this.idcompra = idcompra;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public int getIdproveedor() {
        return idproveedor;
    }

    public void setIdproveedor(int idproveedor) {
        this.idproveedor = idproveedor;
    }

    public int getIddetallecompra() {
        return iddetallecompra;
    }

    public void setIddetallecompra(int iddetallecompra) {
        this.iddetallecompra = iddetallecompra;
    }

    public String getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(String idusuario) {
        this.idusuario = idusuario;
    }
    
    
}
