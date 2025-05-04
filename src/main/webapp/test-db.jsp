<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Database Connection Test</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .success { color: green; }
        .error { color: red; }
        pre { background-color: #f5f5f5; padding: 10px; border-radius: 5px; }
    </style>
</head>
<body>
    <h2>Database Connection Test</h2>
    
    <%
    String url = "jdbc:mysql://localhost:3306/shopfinity?useSSL=false&allowPublicKeyRetrieval=true";
    String user = "root";
    String password = "";
    
    try {
        // Test 1: Load JDBC Driver
        out.println("<h3>Test 1: Loading JDBC Driver</h3>");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            out.println("<p class='success'>✓ MySQL JDBC Driver loaded successfully</p>");
        } catch (ClassNotFoundException e) {
            out.println("<p class='error'>✗ Failed to load MySQL JDBC Driver</p>");
            out.println("<pre>" + e.getMessage() + "</pre>");
            throw e;
        }
        
        // Test 2: Database Connection
        out.println("<h3>Test 2: Database Connection</h3>");
        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            out.println("<p class='success'>✓ Successfully connected to database</p>");
            
            // Test 3: Database Metadata
            out.println("<h3>Test 3: Database Information</h3>");
            DatabaseMetaData meta = conn.getMetaData();
            out.println("<p>Database Product Name: " + meta.getDatabaseProductName() + "</p>");
            out.println("<p>Database Product Version: " + meta.getDatabaseProductVersion() + "</p>");
            out.println("<p>Driver Name: " + meta.getDriverName() + "</p>");
            out.println("<p>Driver Version: " + meta.getDriverVersion() + "</p>");
            
            // Test 4: Check if products table exists
            out.println("<h3>Test 4: Checking Products Table</h3>");
            try (Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM products")) {
                if (rs.next()) {
                    int count = rs.getInt(1);
                    out.println("<p class='success'>✓ Products table exists with " + count + " records</p>");
                }
            }
            
        } catch (SQLException e) {
            out.println("<p class='error'>✗ Failed to connect to database</p>");
            out.println("<p>Error Code: " + e.getErrorCode() + "</p>");
            out.println("<p>SQL State: " + e.getSQLState() + "</p>");
            out.println("<pre>" + e.getMessage() + "</pre>");
        }
        
    } catch (Exception e) {
        out.println("<p class='error'>✗ Test failed</p>");
        out.println("<pre>" + e.getMessage() + "</pre>");
    }
    %>
    
    <h3>Connection Details:</h3>
    <pre>
URL: <%= url %>
User: <%= user %>
Password: <%= password.isEmpty() ? "(empty)" : "********" %>
    </pre>
</body>
</html> 