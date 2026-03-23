package com.mycompany.bibliotecaweb.modelo;

public class Usuario {
    private String rut;
    private String nombre;
    private String contrasena;
    private String correo;
    private Rol rol;

    public Usuario() {
    }

    public Usuario(String rut, String nombre, String contrasena, String correo, Rol rol) {
        this.rut = rut;
        this.nombre = nombre;
        this.contrasena = contrasena;
        this.correo = correo;
        this.rol = rol;
    }
//getters
    public String getRut() {return rut;}

    public String getNombre() {return nombre;}

    public String getContrasena() {return contrasena;}

    public String getCorreo() {return correo;}

    public Rol getRol() {return rol;}

//setters    
    
    public void setRut(String rut) {this.rut = rut;}

    public void setNombre(String nombre) {this.nombre = nombre;}

    public void setContrasena(String contrasena) {this.contrasena = contrasena;}

    public void setCorreo(String correo) {this.correo = correo;}

    public void setRol(Rol rol) {this.rol = rol;}
    

}