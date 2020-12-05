package com.pistamed.entidad;
import com.pistamed.anotaciones.*;
import java.util.Date;

@Entity(table = "factura")
public class Factura {
    @PrimaryKey
    @AutoIncrement
    @NotNull
    private int idfactura;
    @NotNull
    private Double subtotal;
    @NotNull
    private Double total;
    @NotNull
    private Double descuento;
    @NotNull
    private String nombresujeto;
    @NotNull
    private Date fecha;
    @NotNull
    private String idusuario;
    @NotNull
    private int iddetallefactura;

    public Factura() {
    }

    public Factura(int idfactura, Double subtotal, Double total, Double descuento, String nombresujeto, Date fecha, String idusuario, int iddetallefactura) {
        this.idfactura = idfactura;
        this.subtotal = subtotal;
        this.total = total;
        this.descuento = descuento;
        this.nombresujeto = nombresujeto;
        this.fecha = fecha;
        this.idusuario = idusuario;
        this.iddetallefactura = iddetallefactura;
    }

    public int getIdfactura() {
        return idfactura;
    }

    public void setIdfactura(int idfactura) {
        this.idfactura = idfactura;
    }

    public Double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public Double getDescuento() {
        return descuento;
    }

    public void setDescuento(Double descuento) {
        this.descuento = descuento;
    }

    public String getNombresujeto() {
        return nombresujeto;
    }

    public void setNombresujeto(String nombresujeto) {
        this.nombresujeto = nombresujeto;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(String idusuario) {
        this.idusuario = idusuario;
    }

    public int getIddetallefactura() {
        return iddetallefactura;
    }

    public void setIddetallefactura(int iddetallefactura) {
        this.iddetallefactura = iddetallefactura;
    }
    
}
