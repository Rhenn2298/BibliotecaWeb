package com.mycompany.bibliotecaweb.db;

import com.mycompany.bibliotecaweb.modelo.EstadoPrestamo;
import com.mycompany.bibliotecaweb.modelo.Prestamo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLDataException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PrestamoDAO {
//Genera un Prestamo
    public void guardar(Prestamo prestamo) throws SQLException {
        String sql = "INSERT INTO prestamos (rut, id_copia, fecha_solicitud,estado) VALUES (?,?,?,?)";
        try (Connection conn = DatabaseConnection.getInstance().getConnection(); 
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, prestamo.getRut());
            pstmt.setString(2, prestamo.getIdCopia());
            pstmt.setDate(3, java.sql.Date.valueOf(prestamo.getFechaSolicitud()));
            pstmt.setString(4, prestamo.getEstado().name());
            pstmt.executeUpdate();
        }
    }
//Estrcutura Lista
    private Prestamo listarTabla(ResultSet rs) throws SQLException {
        return new Prestamo(
                rs.getInt("id_prestamo"),
                rs.getString("rut"),
                rs.getString("id_copia"),
                rs.getDate("fecha_solicitud").toLocalDate(),
                rs.getDate("fecha_entrega") != null ? rs.getDate("fecha_entrega").toLocalDate() : null,
                rs.getDate("fecha_vencimiento") != null ? rs.getDate("fecha_vencimiento").toLocalDate() : null,
                EstadoPrestamo.valueOf(rs.getString("estado"))
        );
    }
//Listar por rut
    public List<Prestamo> listarPorUsuario(String rut) throws SQLException {
        String sql = "SELECT * FROM prestamos WHERE rut = ?";
        List<Prestamo> prestamos = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getInstance().getConnection(); 
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, rut);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                prestamos.add(listarTabla(rs));
            }
        }
        return prestamos;
    }
//Actualizar datos Estado - Fechas
    public void actualizar(Prestamo prestamo) throws SQLException {
        String sql = "UPDATE prestamos SET estado = ?, fecha_entrega = ?, fecha_vencimiento = ? WHERE id_prestamo = ?";
        try (Connection conn = DatabaseConnection.getInstance().getConnection(); 
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, prestamo.getEstado().name());
            pstmt.setDate(2, prestamo.getFechaEntrega() != null ? java.sql.Date.valueOf(prestamo.getFechaEntrega()) : null);
            pstmt.setDate(3, prestamo.getFechaVencimiento() != null ? java.sql.Date.valueOf(prestamo.getFechaVencimiento()) : null);
            pstmt.setInt(4, prestamo.getIdPrestamo());
            pstmt.executeUpdate();
        }
    }     
//Lista de resultados sin filtro    
    public List<Prestamo> listar(String estado) throws SQLException {
        String sql = "SELECT * FROM prestamos";
        if (estado != null && !estado.isEmpty()) {
            sql += " WHERE estado = ?";
        }
        List<Prestamo> prestamos = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getInstance().getConnection(); 
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            if (estado != null && !estado.isEmpty()) {
                pstmt.setString(1, estado);
            }
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                prestamos.add(listarTabla(rs));
            }
        }
        return prestamos;
    }
//Listas Filtradas:    
//Lista Solicitados
    public List<Prestamo> listarSolicitados() throws SQLException {
        return listar("SOLICITADO");
    }
//Lista Lista Entregados

    public List<Prestamo> listarEntregados() throws SQLException {
        return listar("ENTREGADO");
    }
//Lista Vencidos

    public List<Prestamo> listarVencidos() throws SQLException {
        return listar("VENCIDO");
    }
//Lista devueltos
    public List<Prestamo> listarDevueltos() throws SQLException {
        return listar("DEVUELTO");
    } 
}

