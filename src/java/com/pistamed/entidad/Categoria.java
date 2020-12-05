package com.pistamed.entidad;
import com.pistamed.anotaciones.*;

@Entity(table = "categoria")
public class Categoria {
    @PrimaryKey
    @AutoIncrement
    @NotNull
    private int idcategoria;
    @NotNull
    private String nombre;

    public Categoria() {
    }

    public Categoria(int idcategoria, String nombre) {
        this.idcategoria = idcategoria;
        this.nombre = nombre;
    }

    public int getIdcategoria() {
        return idcategoria;
    }

    public void setIdcategoria(int idcategoria) {
        this.idcategoria = idcategoria;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    
}
