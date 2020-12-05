package com.pistamed.entidad;
import com.pistamed.anotaciones.*;

@Entity(table = "rol")
public class Roles {
    @PrimaryKey
    @AutoIncrement
    private int idrol;
    @NotNull
    private String rol;

    public Roles() {
    }

    public Roles(int idrol, String rol) {
        this.idrol = idrol;
        this.rol = rol;
    }

    public int getIdrol() {
        return idrol;
    }

    public void setIdrol(int idrol) {
        this.idrol = idrol;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }
    
    
}
