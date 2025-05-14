package com.contact.dao;

import com.contact.model.Contact;
import com.register.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ContactDAO {
    private Connection connection;

    public ContactDAO(Connection connection) {
        this.connection = connection;
    }

    // Create
    public void addContact(Contact contact) throws SQLException {
        String sql = "INSERT INTO contact_us (name, email, contact_number, question) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, contact.getName());
            stmt.setString(2, contact.getEmail());
            stmt.setString(3, contact.getContactNumber());
            stmt.setString(4, contact.getQuestion());
            stmt.executeUpdate();
        }
    }

    // Read all
    public List<Contact> getAllContacts() throws SQLException {
        List<Contact> contactList = new ArrayList<>();
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
        }
        return contactList;
    }

    // Read by ID
    public Contact getContactById(int id) throws SQLException {
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
                    return c;
                }
            }
        }
        return null;
    }

    // Update
    public void updateContact(Contact contact) throws SQLException {
        String sql = "UPDATE contact_us SET name = ?, email = ?, contact_number = ?, question = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, contact.getName());
            stmt.setString(2, contact.getEmail());
            stmt.setString(3, contact.getContactNumber());
            stmt.setString(4, contact.getQuestion());
            stmt.setInt(5, contact.getId());
            stmt.executeUpdate();
        }
    }

    // Delete
    public void deleteContact(int id) throws SQLException {
        String sql = "DELETE FROM contact_us WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }
}
