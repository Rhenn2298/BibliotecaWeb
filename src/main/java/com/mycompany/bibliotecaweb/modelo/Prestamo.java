package com.mycompany.bibliotecaweb.modelo;
//Datos de un prestamo, contiene datos de un usuario y libros
import java.time.LocalDate;

public class Prestamo {

    private int idPrestamo;
    private String rut;
    private String idCopia;
    private LocalDate fechaSolicitud;
    private LocalDate fechaEntrega;
    private LocalDate fechaVencimiento;
    private EstadoPrestamo estado;
    private Libro libro;
    private Usuario usuario;

    public Prestamo() {
    }

    public Prestamo(
            int idPrestamo, 
            String rut, 
            String idCopia, 
            LocalDate fechaSolicitud, 
            LocalDate fechaEntrega, 
            LocalDate fechaVencimiento, 
            EstadoPrestamo estado
    ) {
        this.idPrestamo = idPrestamo;
        this.rut = rut;
        this.idCopia = idCopia;
        this.fechaSolicitud = fechaSolicitud;
        this.fechaEntrega = fechaEntrega;
        this.fechaVencimiento = fechaVencimiento;
        this.estado = estado;
    }
//getters
    public int getIdPrestamo() {return idPrestamo;}

    public String getRut() {return rut;}

    public String getIdCopia() {return idCopia;}

    public LocalDate getFechaSolicitud() {return fechaSolicitud;}

    public LocalDate getFechaEntrega() {return fechaEntrega;}

    public LocalDate getFechaVencimiento() {return fechaVencimiento;}

    public EstadoPrestamo getEstado() {return estado;}

    public Libro getLibro() {return libro;}

    public Usuario getUsuario() {return usuario;}
    
//setters    
    
    public void setIdPrestamo(int idPrestamo) {this.idPrestamo = idPrestamo;}

    public void setRut(String rut) {this.rut = rut;}

    public void setIdCopia(String idCopia) {this.idCopia = idCopia;}

    public void setFechaSolicitud(LocalDate fechaSolicitud) {this.fechaSolicitud = fechaSolicitud;}

    public void setFechaEntrega(LocalDate fechaEntrega) {this.fechaEntrega = fechaEntrega;}

    public void setFechaVencimiento(LocalDate fechaVencimiento) {this.fechaVencimiento = fechaVencimiento;}

    public void setEstado(EstadoPrestamo estado) {this.estado = estado;}

    public void setLibro(Libro libro) {this.libro = libro;}

    public void setUsuario(Usuario usuario) {this.usuario = usuario;}
    
    

}
