package com.mycompany.bibliotecaweb.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    //Datos de conexion
    private static final String URL = "jdbc:mysql://localhost:3306/biblioteca";
    private static final String USER = "root";
    private static final String PASSWORD = "";
    private static final String DRIVER =  "com.mysql.cj.jdbc.Driver";
    //implementacion singleton
    private static DatabaseConnection instance;
    private Connection cnx;
    //constructor
    private DatabaseConnection() throws SQLException {
        try {
            Class.forName(DRIVER);
            cnx = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Conexión a BD establecida");
        } catch (ClassNotFoundException e) {
            System.err.println("Error: Driver MySQL no encontrado");
            e.printStackTrace();
        }
    }
    
    public static DatabaseConnection getInstance() throws SQLException {
        if (instance == null) {
            instance = new DatabaseConnection();
        }
        return instance;
    }
    
    public Connection getConnection() throws SQLException {
        if (cnx == null || cnx.isClosed()) {
            System.out.println("Reconectando a BD...");
            cnx = DriverManager.getConnection(URL, USER, PASSWORD);
        }
        return cnx;
    }
    //test
    public static void testConnection() {
        try (Connection conn = getInstance().getConnection()){
            if (conn != null){
                System.out.println("conectado");
            }
        } catch (SQLException e) {
            System.err.println("Error en conexion" + e.getMessage());
            e.printStackTrace();
        }
    }
}
