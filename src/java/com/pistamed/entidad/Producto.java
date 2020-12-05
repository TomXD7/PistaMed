package com.pistamed.entidad;
import com.pistamed.anotaciones.*;
import java.sql.Timestamp;
import java.util.Date;

@Entity(table = "producto")
public class Producto {
    @PrimaryKey
    @AutoIncrement
    @NotNull
    private int idproducto;
    @NotNull
    private String nombre;
    @NotNull
    private Double precio;
    @NotNull
    private Timestamp fechavencimiento;
    @NotNull
    private int existencia;
    @NotNull
    private int idcategoria;
    @NotNull
    private int idpresentacion;

    public Producto() {
    }

    public Producto(int idproducto, String nombre, Double precio, Timestamp fechavencimiento, int existencia, int idcategoria, int idpresentacion) {
        this.idproducto = idproducto;
        this.nombre = nombre;
        this.precio = precio;
        this.fechavencimiento = fechavencimiento;
        this.existencia = existencia;
        this.idcategoria = idcategoria;
        this.idpresentacion = idpresentacion;
    }

    public int getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(int idproducto) {
        this.idproducto = idproducto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    public Timestamp getFechavencimiento() {
        return fechavencimiento;
    }

    public void setFechavencimiento(Timestamp fechavencimiento) {
        this.fechavencimiento = fechavencimiento;
    }

    public int getExistencia() {
        return existencia;
    }

    public void setExistencia(int existencia) {
        this.existencia = existencia;
    }

    public int getIdcategoria() {
        return idcategoria;
    }

    public void setIdcategoria(int idcategoria) {
        this.idcategoria = idcategoria;
    }

    public int getIdpresentacion() {
        return idpresentacion;
    }

    public void setIdpresentacion(int idpresentacion) {
        this.idpresentacion = idpresentacion;
    }
    
    
}
