package br.com.luiza.web;

public class User {
    private String nome;
    private String email;
    private int passwordHash;

    public User(String nome, String email, int passwordHash) {
        this.nome = nome;
        this.email = email;
        this.passwordHash = passwordHash;
    }

    public int getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(int passwordHash) {
        this.passwordHash = passwordHash;
    }

    public String getNome() {
        return nome;
    }

    public void setName(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
}