package com.mycompany.bibliotecaweb.db;

import com.mycompany.bibliotecaweb.modelo.Rol;
import com.mycompany.bibliotecaweb.modelo.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioDAO {
//Establece el inicio de sesion si corresponde a uno en BBDD
    public Usuario validarLogin(String rut, String contrasena) throws SQLException {
        String sql = "SELECT * FROM usuarios WHERE rut = ? AND contraseña = ?";
        try (Connection conn = DatabaseConnection.getInstance().getConnection(); 
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, rut);
            pstmt.setString(2, contrasena);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return new Usuario(
                        rs.getString("rut"),
                        rs.getString("nombre"),
                        rs.getString("contraseña"),
                        rs.getString("correo"),
                        Rol.valueOf(rs.getString("rol"))
                );
            }
        }
        return null;
    }
//Obtiene el Usuario registrado por su RUT
    public Usuario obtenerUsuarioPorRut(String rut) throws SQLException {
        String sql = "SELECT * FROM usuarios WHERE rut = ?";
        try (Connection conn = DatabaseConnection.getInstance().getConnection(); 
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, rut);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return new Usuario(
                        rs.getString("rut"),
                        rs.getString("nombre"),
                        rs.getString("contraseña"),
                        rs.getString("correo"),
                        Rol.valueOf(rs.getString("rol"))
                );
            }
        }
        return null;
    }

}
