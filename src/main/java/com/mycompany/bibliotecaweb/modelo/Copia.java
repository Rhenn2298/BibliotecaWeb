package com.mycompany.bibliotecaweb.modelo;
//Datos de un libro fisico en especifico, la biblioteca peude tener x cantidades de un mismo libro
public class Copia {

    private String idCopia;
    private String isbn;
    private int numeroCopia;
    private boolean disponible;
    private Libro libro;


    public Copia() {
    }

    public Copia(String idCopia, String isbn, int numeroCopia, boolean disponible) {
        this.idCopia = idCopia;
        this.isbn = isbn;
        this.numeroCopia = numeroCopia;
        this.disponible = disponible;
    }
//getters
    public String getIdCopia() {return idCopia;}

    public String getIsbn() {return isbn;}

    public int getNumeroCopia() {return numeroCopia;}

    public boolean isDisponible() {return disponible;}

    public Libro getLibro() {return libro;}

//setters
    public void setIdCopia(String idCopia) {this.idCopia = idCopia;}

    public void setIsbn(String isbn) {this.isbn = isbn;}

    public void setNumeroCopia(int numeroCopia) {this.numeroCopia = numeroCopia;}

    public void setDisponible(boolean disponible) {this.disponible = disponible;}

    public void setLibro(Libro libro) {this.libro = libro;}
    
    
     
}
