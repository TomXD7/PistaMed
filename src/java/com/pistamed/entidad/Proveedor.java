package com.pistamed.entidad;
import com.pistamed.anotaciones.*;

@Entity(table = "proveedor")
public class Proveedor {
    @PrimaryKey
    @AutoIncrement
    private int idproveedor;
    @NotNull
    private String nombre;
    private String direccion;
    @NotNull
    private String telefono;
    @NotNull
    private String correo;

    public Proveedor() {
    }

    public Proveedor(int idproveedor, String nombre, String direccion, String telefono, String correo) {
        this.idproveedor = idproveedor;
        this.nombre = nombre;
        this.direccion = direccion;
        this.telefono = telefono;
        this.correo = correo;
    }

    public int getIdproveedor() {
        return idproveedor;
    }

    public void setIdproveedor(int idproveedor) {
        this.idproveedor = idproveedor;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }
}
