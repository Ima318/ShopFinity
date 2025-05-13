import contact.shopfinity.model.Contact;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ContactDAO {
    private Connection connection;

    public ContactDAO(Connection connection) {
        this.connection = connection;
    }

    // Add a new contact
    public void addContact(Contact contact) {
        String sql = "INSERT INTO contacts (name, email, contactNumber, question) VALUES (?, ?, ?, ?)";
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

    // Get all contacts
    public List<Contact> getAllContacts() {
        List<Contact> contacts = new ArrayList<>();
        String sql = "SELECT * FROM contacts";
        try (Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Contact contact = new Contact();
                contact.setId(rs.getInt("id"));
                contact.setName(rs.getString("name"));
                contact.setEmail(rs.getString("email"));
                contact.setContactNumber(rs.getString("contactNumber"));
                contact.setQuestion(rs.getString("question"));
                contacts.add(contact);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contacts;
    }

    // Get a contact by ID
    public Contact getContactById(int id) {
        Contact contact = null;
        String sql = "SELECT * FROM contacts WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                contact = new Contact();
                contact.setId(rs.getInt("id"));
                contact.setName(rs.getString("name"));
                contact.setEmail(rs.getString("email"));
                contact.setContactNumber(rs.getString("contactNumber"));
                contact.setQuestion(rs.getString("question"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contact;
    }

    // Update a contact
    public void updateContact(Contact contact) {
        String sql = "UPDATE contacts SET name = ?, email = ?, contactNumber = ?, question = ? WHERE id = ?";
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

    // Delete a contact
    public void deleteContact(int id) {
        String sql = "DELETE FROM contacts WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

