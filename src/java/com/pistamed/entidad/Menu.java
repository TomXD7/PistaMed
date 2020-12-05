package com.pistamed.entidad;
import com.pistamed.anotaciones.*;

@Entity(table = "menu")
public class Menu {
    @PrimaryKey
    @AutoIncrement
    @NotNull
    private int idmenu;
    @NotNull
    private String menu;
    private String descripcion;
    private String url;
    private int idpadre;

    public Menu() {
    }

    public Menu(int idmenu, String menu, String descripcion, String url, int idpadre) {
        this.idmenu = idmenu;
        this.menu = menu;
        this.descripcion = descripcion;
        this.url = url;
        this.idpadre = idpadre;
    }

    public int getIdmenu() {
        return idmenu;
    }

    public void setIdmenu(int idmenu) {
        this.idmenu = idmenu;
    }

    public String getMenu() {
        return menu;
    }

    public void setMenu(String menu) {
        this.menu = menu;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getIdpadre() {
        return idpadre;
    }

    public void setIdpadre(int idpadre) {
        this.idpadre = idpadre;
    }
    
    
}
