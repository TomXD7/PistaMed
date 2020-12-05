package com.pistamed.entidad;
import com.pistamed.anotaciones.*;

@Entity(table = "detallecompra")
public class DetalleCompra {
    @PrimaryKey
    @NotNull
    @AutoIncrement
    private int iddetallecompra;
    @NotNull
    private int idproducto;
    @NotNull
    private int cantidad;
    @NotNull
    private Double preciounitario;
    @NotNull
    private Double total;

    public DetalleCompra() {
    }

    public DetalleCompra(int iddetallecompra, int idproducto, int cantidad, Double preciounitario, Double total) {
        this.iddetallecompra = iddetallecompra;
        this.idproducto = idproducto;
        this.cantidad = cantidad;
        this.preciounitario = preciounitario;
        this.total = total;
    }

    public int getIddetallecompra() {
        return iddetallecompra;
    }

    public void setIddetallecompra(int iddetallecompra) {
        this.iddetallecompra = iddetallecompra;
    }

    public int getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(int idproducto) {
        this.idproducto = idproducto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Double getPreciounitario() {
        return preciounitario;
    }

    public void setPreciounitario(Double preciounitario) {
        this.preciounitario = preciounitario;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }
    
    
}
