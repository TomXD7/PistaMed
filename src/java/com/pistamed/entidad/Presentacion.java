package com.pistamed.entidad;
import com.pistamed.anotaciones.*;

@Entity(table = "presentacion")
public class Presentacion {
    @PrimaryKey
    @AutoIncrement
    @NotNull
    private int idpresentacion;
    @NotNull
    private String nombre;

    public Presentacion() {
    }

    public Presentacion(int idpresentacion, String nombre) {
        this.idpresentacion = idpresentacion;
        this.nombre = nombre;
    }

    public int getIdpresentacion() {
        return idpresentacion;
    }

    public void setIdpresentacion(int idpresentacion) {
        this.idpresentacion = idpresentacion;
    }

    public String getPresentacion() {
        return nombre;
    }

    public void setPresentacion(String nombre) {
        this.nombre = nombre;
    }
    
    
}
