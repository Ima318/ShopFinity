package com.contact.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/shopfinity";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    private static DBConnection instance;
    private Connection connection;

    private DBConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.connection = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Database connection established successfully.");
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC Driver not found.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Error establishing connection: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // Thread-safe Singleton Instance
    public static synchronized DBConnection getInstance() {
        if (instance == null || instance.connection == null || !isConnectionValid()) {
            System.out.println("Creating new DBConnection instance...");
            instance = new DBConnection();
        } else {
            System.out.println("Returning existing DBConnection instance...");
        }
        return instance;
    }

    private static boolean isConnectionValid() {
        try {
            return instance != null && instance.connection != null && !instance.connection.isClosed() && instance.connection.isValid(2);
        } catch (SQLException e) {
            return false;
        }
    }


    // Get the database connection
    public Connection getConnection() {
        try {
            if (connection == null || connection.isClosed() || !connection.isValid(2)) {
                System.out.println("Connection is invalid, re-establishing...");
                connection = DriverManager.getConnection(URL, USER, PASSWORD);
                System.out.println("Reconnected to the database.");
            }
        } catch (SQLException e) {
            System.err.println("Failed to get database connection: " + e.getMessage());
            e.printStackTrace();
        }
        return connection;
    }


    // Close the connection safely
    public void closeConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
                System.out.println("Database connection closed.");
            }
        } catch (SQLException e) {
            System.err.println("Error closing connection: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
