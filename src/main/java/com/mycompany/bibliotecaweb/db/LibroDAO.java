package com.mycompany.bibliotecaweb.db;

import com.mycompany.bibliotecaweb.modelo.Genero;
import com.mycompany.bibliotecaweb.modelo.Libro;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class LibroDAO {
//gestiona los libros guardados en BBDD
    public void guardar(Libro libro) throws SQLException {
        String sql = "INSERT INTO libros (isbn, titulo, autor, genero, editorial, año_publicacion) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getInstance().getConnection(); 
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, libro.getIsbn());
            pstmt.setString(2, libro.getTitulo());
            pstmt.setString(3, libro.getAutor());
            pstmt.setString(4, libro.getGenero().name());
            pstmt.setString(5, libro.getEditorial());
            pstmt.setInt(6, libro.getYearPublicacion());

            pstmt.executeUpdate();
        }
    }
//Busca un libro por su ISBN
    public Libro buscarPorIsbn(String isbn) throws SQLException {
        String sql = "SELECT * FROM libros WHERE isbn = ?";
        try (Connection conn = DatabaseConnection.getInstance().getConnection(); 
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, isbn);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return new Libro(
                        rs.getString("isbn"),
                        rs.getString("titulo"),
                        rs.getString("autor"),
                        Genero.valueOf(rs.getString("genero")),
                        rs.getString("editorial"),
                        rs.getInt("año_publicacion")
                );
            }
        }
        return null;
    }
//Buscar un libro por su Titulo (para bara de busqueda)
    public Libro buscarLibro(String titulo) throws SQLException {
        String sql = "SELECT * FROM libros WHERE titulo = ?";
        try (Connection conn = DatabaseConnection.getInstance().getConnection(); 
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, titulo);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return new Libro(
                        rs.getString("isbn"),
                        rs.getString("titulo"),
                        rs.getString("autor"),
                        Genero.valueOf(rs.getString("genero")),
                        rs.getString("editorial"),
                        rs.getInt("año_publicacion")
                );
            }
        }
        return null;
    }
//Lista los libros registrados en BBDD
    public List<Libro> listarTodos() throws SQLException {
        String sql = "SELECT * FROM libros";
        List<Libro> libros = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getInstance().getConnection(); 
                Statement stmt = conn.createStatement(); 
                ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                libros.add(new Libro(
                        rs.getString("isbn"),
                        rs.getString("titulo"),
                        rs.getString("autor"),
                        Genero.valueOf(rs.getString("genero")),
                        rs.getString("editorial"),
                        rs.getInt("año_publicacion")
                ));
            }
        }
        return libros;
    }
//Actualiza los datos d eun libro en BBDD
    public void actualizar(Libro libro) throws SQLException {
        String sql = "UPDATE libros SET titulo = ?, autor = ?, genero = ?, editorial = ?, año_publicacion = ? WHERE isbn = ?";
        try (Connection conn = DatabaseConnection.getInstance().getConnection(); 
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, libro.getTitulo());
            pstmt.setString(2, libro.getAutor());
            pstmt.setString(3, libro.getGenero().name());
            pstmt.setString(4, libro.getEditorial());
            pstmt.setInt(5, libro.getYearPublicacion());
            pstmt.setString(6, libro.getIsbn());

            pstmt.executeUpdate();
        }
    }
//elimina un libro (en estudio si utilizar)
    public void eliminar(String isbn) throws SQLException {
        String sql = "DELETE FROM libros WHERE isbn = ?";
        try (Connection conn = DatabaseConnection.getInstance().getConnection(); 
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, isbn);
            pstmt.execute();
        }
    }
}
