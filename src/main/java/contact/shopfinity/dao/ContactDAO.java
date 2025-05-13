package contact.shopfinity.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import contact.shopfinity.model.Contact;

public class ContactDAO {
    private Connection connection;

    public ContactDAO(Connection connection) {
        this.connection = connection;
    }

    // Create
    public void addContact(Contact contact) {
        String sql = "INSERT INTO contact (name, email, contact_number, question) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, contact.getName());
            stmt.setString(2, contact.getEmail());
            stmt.setString(3, contact.getContactNumber());
            stmt.setString(4, contact.getQuestion());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Read all
    public List<Contact> getAllContacts() {
        List<Contact> contactList = new ArrayList<>();
        String sql = "SELECT * FROM contact";
        try (Statement stmt = connection.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Contact c = new Contact();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setEmail(rs.getString("email"));
                c.setContactNumber(rs.getString("contact_number"));
                c.setQuestion(rs.getString("question"));
                contactList.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contactList;
    }

    // Read by ID
    public Contact getContactById(int id) {
        String sql = "SELECT * FROM contact WHERE id = ?";
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
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Update
    public void updateContact(Contact contact) {
        String sql = "UPDATE contact SET name = ?, email = ?, contact_number = ?, question = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, contact.getName());
            stmt.setString(2, contact.getEmail());
            stmt.setString(3, contact.getContactNumber());
            stmt.setString(4, contact.getQuestion());
            stmt.setInt(5, contact.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Delete
    public void deleteContact(int id) {
        String sql = "DELETE FROM contact WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
