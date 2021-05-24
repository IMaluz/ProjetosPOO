package br.com.luiza.web;

import java.util.ArrayList;

public class Armazenamento {
	private static ArrayList<User> users;
	private static ArrayList<Contatos> contatos;

	public static ArrayList<User> getUsers() {
		if (users == null) {
			users = new ArrayList<>();
			users.add(new User("Bernardo Fonseca", "bernardo@email.com", "12345".hashCode()));
			users.add(new User("Julia Alves", "julia@email.com", "1234".hashCode()));
		}
		return users;
	}

	public static ArrayList<Contatos> getContatos() {
		if (contatos == null) {
			contatos = new ArrayList<>();
			contatos.add(new Contatos("Maria Fernanda", "mafe@email.com", "131517"));
			contatos.add(new Contatos("Luna Fonseca", "luna@email.com", "1315"));
		}
		return contatos;
	}

	
	
	public static User getUser(String email, String password) {
		int hashCode = password.hashCode();
		for (User user : getUsers()) {
			if (user.getEmail().equals(email) && user.getPasswordHash() == hashCode) {
				return user;
			}
		}
		return null;
	}

	public static void addUser(User newUser) {
		getUsers().add(newUser);
	}

	public static void removeUser(String email) {
		for (int i = 0; i < users.size(); i++) {
			if (users.get(i).getEmail().equals(email)) {
				getUsers().remove(i);
			}
		}
	}
	public static void addContatos(Contatos newContato){
        getContatos().add(newContato);
    }
    
    public static void removeContatos(String email){
        for(int i=0 ; i< contatos.size(); i++){
            if(contatos.get(i).getEmail().equals(email)){
                getContatos().remove(i);
            }
        }
    }
}
