package com.mycompany.bibliotecaweb.db;

import com.mycompany.bibliotecaweb.modelo.Copia;
import com.mycompany.bibliotecaweb.modelo.Libro;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CopiaDAO {
//Genera una nueva copia de un libro
    public void guardar(Copia copia) throws SQLException {
        String idCopia = copia.getIsbn() + "CN" + String.format("%02d", copia.getNumeroCopia());
        String sql = "INSERT INTO copias (id_copia, isbn, número_copia, disponible) VALUES (?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getInstance().getConnection(); 
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, idCopia);
            pstmt.setString(2, copia.getIsbn());
            pstmt.setInt(3, copia.getNumeroCopia());
            pstmt.setBoolean(4, copia.isDisponible());
            pstmt.executeUpdate();
        }
    }
//Buscar todas las copias de un libro en BBDD
    public List<Copia> listarCopias(String isbn) throws SQLException {
        String sql = "SELECT * FROM copias WHERE isbn = ?";
        List<Copia> copias = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getInstance().getConnection(); 
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, isbn);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Copia copia = new Copia();
                copia.setIdCopia(rs.getString("id_copia"));
                copia.setIsbn(rs.getString("isbn"));
                copia.setNumeroCopia(rs.getInt("número_copia"));
                copia.setDisponible(rs.getBoolean("disponible"));
                copias.add(copia);
            }
        }
        return copias;
    }
//Buscar y listar solo copias con estado Disponible
    public List<Copia> listarDisponibles(String isbn) throws SQLException {
        String sql = "SELECT * FROM copias WHERE isbn = ? AND disponible = true";
        List<Copia> copias = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getInstance().getConnection(); 
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, isbn);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Copia copia = new Copia();
                copia.setIdCopia(rs.getString("id_copia"));
                copia.setIsbn(rs.getString("isbn"));
                copia.setNumeroCopia(rs.getInt("número_copia"));
                copia.setDisponible(rs.getBoolean("disponible"));
                copias.add(copia);
            }
        }
        return copias;
    }
//Genera el siguiente ID a utilizar utilizando el ultimo registrado
    public int obtenerSiguienteID(String isbn) throws SQLException {
        String sql = "SELECT MAX(número_copia) as max FROM copias WHERE isbn = ?";
        try (Connection conn = DatabaseConnection.getInstance().getConnection(); 
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, isbn);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                int max = rs.getInt("max");
                return (max == 0) ? 1 : max + 1;
            }
        }
        return 1;
    }
//Obtener los datos de una copia usando un ID de copia
    public Copia obtenerIdCopia(String idCopia) throws SQLException {
    String sql = "SELECT * FROM copias WHERE id_copia = ?";
    try (Connection conn = DatabaseConnection.getInstance().getConnection(); 
            PreparedStatement pstmt = conn.prepareStatement(sql)) {
        pstmt.setString(1, idCopia);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            Copia copia = new Copia();
            copia.setIdCopia(rs.getString("id_copia"));
            copia.setIsbn(rs.getString("isbn"));
            copia.setNumeroCopia(rs.getInt("número_copia"));
            copia.setDisponible(rs.getBoolean("disponible"));
            return copia;
        }
    }
    return null;
}
//Fijar disponibilidad d euna copia
    public void actualizarEstado(String idCopia, boolean disponible) throws SQLException {
        String sql = "UPDATE copias SET disponible = ? WHERE id_copia = ?";
        try (Connection conn = DatabaseConnection.getInstance().getConnection(); 
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setBoolean(1, disponible);
            pstmt.setString(2, idCopia);
            pstmt.executeUpdate();
        }
    }
//Elimina una copia registrada
    public void eliminar(String idCopia) throws SQLException {
        String sql = "DELETE FROM copias WHERE id_copia = ?";
        try (Connection conn = DatabaseConnection.getInstance().getConnection(); 
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, idCopia);
            pstmt.executeUpdate();
        }
    }
//Cuenta cuantas copias estan diponibles
    public int contarDisponibles(String isbn) throws SQLException {
        String sql = "SELECT COUNT(*) as total FROM copias WHERE isbn = ? AND disponible = true";

        try (Connection conn = DatabaseConnection.getInstance().getConnection(); 
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, isbn);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return rs.getInt("total");
            }
        }
        return 0;
    }
}
