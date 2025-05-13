package contact.shopfinity.model;

public class Contact {
    private int id;
    private String name;
    private String email;
    private String contactNumber;
    private String question;

    // Constructors, Getters and Setters
    public Contact() { }

    public Contact(String name, String email, String contactNumber, String question) {
        this.name = name;
        this.email = email;
        this.contactNumber = contactNumber;
        this.question = question;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }
}
