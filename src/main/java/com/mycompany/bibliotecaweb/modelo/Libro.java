package com.mycompany.bibliotecaweb.modelo;
//Libros, datos de un libro en particular.
public class Libro {
    private String isbn;
    private String titulo;
    private String autor;
    private Genero genero;
    private String editorial;
    private int yearPublicacion;

    public Libro() {
    }

    public Libro(String isbn, String titulo, String autor, 
                    Genero genero, String editorial, int yearPublicacion) {
        this.isbn = isbn;
        this.titulo = titulo;
        this.autor = autor;
        this.genero = genero;
        this.editorial = editorial;
        this.yearPublicacion = yearPublicacion;
    }
//getters
    public String getIsbn() {return isbn;}

    public String getTitulo() {return titulo;}

    public String getAutor() {return autor;}

    public Genero getGenero() {return genero;}

    public String getEditorial() {return editorial;}

    public int getYearPublicacion() {return yearPublicacion;}
//setters
    public void setIsbn(String isbn) {this.isbn = isbn;}

    public void setTitulo(String titulo) {this.titulo = titulo;}

    public void setAutor(String autor) {this.autor = autor;}

    public void setGenero(Genero genero) {this.genero = genero;}

    public void setEditorial(String editorial) {this.editorial = editorial;}

    public void setYearPublicacion(int yearPublicacion) {this.yearPublicacion = yearPublicacion;}
}
