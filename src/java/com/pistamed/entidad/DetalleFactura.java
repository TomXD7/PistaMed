package com.pistamed.entidad;
import com.pistamed.anotaciones.*;

@Entity(table = "detallefactura")
public class DetalleFactura {
    @PrimaryKey
    @AutoIncrement
    @NotNull
    private int iddetallefactura;
    @NotNull
    private int cantidad;
    @NotNull
    private Double precioventa;
    @NotNull
    private int idproducto;

    public DetalleFactura() {
    }

    public DetalleFactura(int iddetallefactura, int cantidad, Double precioventa, int idproducto) {
        this.iddetallefactura = iddetallefactura;
        this.cantidad = cantidad;
        this.precioventa = precioventa;
        this.idproducto = idproducto;
    }

    public int getIddetallefactura() {
        return iddetallefactura;
    }

    public void setIddetallefactura(int iddetallefactura) {
        this.iddetallefactura = iddetallefactura;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Double getPrecioventa() {
        return precioventa;
    }

    public void setPrecioventa(Double precioventa) {
        this.precioventa = precioventa;
    }

    public int getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(int idproducto) {
        this.idproducto = idproducto;
    }
    
    
}
