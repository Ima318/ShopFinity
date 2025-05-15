package com.contact.dao;

import com.contact.model.Contact;
import com.contact.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ContactDAO {
    private Connection connection;

    // Constructor to initialize connection
    public ContactDAO(Connection connection) {
        this.connection = connection;
        if (this.connection == null) {
            System.err.println("Warning: DB connection is null in ContactDAO.");
        }
    }


    // Create - Add a new contact
    public void addContact(Contact contact) throws SQLException {
        if (connection == null) {
            throw new SQLException("Database connection is not available.");
        }

        String sql = "INSERT INTO contact_us (name, email, contact_number, question) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, contact.getName());
            stmt.setString(2, contact.getEmail());
            stmt.setString(3, contact.getContactNumber());
            stmt.setString(4, contact.getQuestion());
            int rowsAffected = stmt.executeUpdate();
            System.out.println("Rows inserted: " + rowsAffected);
        } catch (SQLException e) {
            System.err.println("Error adding contact: " + e.getMessage());
            throw e;
        }
    }

    // Read all contacts
    public List<Contact> getAllContacts() throws SQLException {
        List<Contact> contactList = new ArrayList<>();
        if (connection == null) {
            throw new SQLException("Database connection is not available.");
        }

        String sql = "SELECT * FROM contact_us ORDER BY created_at DESC";
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Contact c = new Contact();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setEmail(rs.getString("email"));
                c.setContactNumber(rs.getString("contact_number"));
                c.setQuestion(rs.getString("question"));
                contactList.add(c);
            }
            System.out.println("Fetched " + contactList.size() + " contacts.");
        } catch (SQLException e) {
            System.err.println("Error fetching contacts: " + e.getMessage());
            throw e;
        }
        return contactList;
    }

    // Read a contact by ID
    public Contact getContactById(int id) throws SQLException {
        if (connection == null) {
            throw new SQLException("Database connection is not available.");
        }

        String sql = "SELECT * FROM contact_us WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Contact c = new Contact();
                    c.setId(rs.getInt("id"));
                    c.setName(rs.getString("name"));
                    c.setEmail(rs.getString("email"));
                    c.setContactNumber(rs.getString("contact_number"));
                    c.setQuestion(rs.getString("question"));
                    System.out.println("Contact found: " + c.getName());
                    return c;
                }
            }
        } catch (SQLException e) {
            System.err.println("Error retrieving contact by ID: " + e.getMessage());
            throw e;
        }
        System.out.println("No contact found with ID: " + id);
        return null;
    }

    // Update a contact
    public void updateContact(Contact contact) throws SQLException {
        if (connection == null) {
            throw new SQLException("Database connection is not available.");
        }

        String sql = "UPDATE contact_us SET name = ?, email = ?, contact_number = ?, question = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, contact.getName());
            stmt.setString(2, contact.getEmail());
            stmt.setString(3, contact.getContactNumber());
            stmt.setString(4, contact.getQuestion());
            stmt.setInt(5, contact.getId());
            int rowsUpdated = stmt.executeUpdate();
            System.out.println("Rows updated: " + rowsUpdated);
        } catch (SQLException e) {
            System.err.println("Error updating contact: " + e.getMessage());
            throw e;
        }
    }

    // Delete a contact
    public void deleteContact(int id) throws SQLException {
        if (connection == null) {
            throw new SQLException("Database connection is not available.");
        }

        String sql = "DELETE FROM contact_us WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            int rowsDeleted = stmt.executeUpdate();
            System.out.println("Rows deleted: " + rowsDeleted);
        } catch (SQLException e) {
            System.err.println("Error deleting contact: " + e.getMessage());
            throw e;
        }
    }
}
