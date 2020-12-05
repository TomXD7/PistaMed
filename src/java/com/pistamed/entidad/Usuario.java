package com.pistamed.entidad;
import com.pistamed.anotaciones.*;

@Entity(table = "usuario")
public class Usuario {
    @PrimaryKey
    @NotNull
    private String idusuario;
    @NotNull
    private String nombres;
    @NotNull
    private String apellidos;
    @NotNull
    private String correo;
    @NotNull
    private String clave;
    @NotNull
    private int idrol;

    public Usuario() {
    }

    public Usuario(String idusuario, String nombres, String apellidos, String correo, String clave, int idrol) {
        this.idusuario = idusuario;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.correo = correo;
        this.clave = clave;
        this.idrol = idrol;
    }

    public String getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(String idusuario) {
        this.idusuario = idusuario;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public int getIdrol() {
        return idrol;
    }

    public void setIdrol(int idrol) {
        this.idrol = idrol;
    }
    
    
}
