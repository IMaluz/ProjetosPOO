package br.com.luiza.web;

import java.util.ArrayList;

public class Armazenamento {
	private static ArrayList<User> users;

	public static ArrayList<User> getUsers() {
		if (users == null) {
			users = new ArrayList<>();
			users.add(new User("Antônio Fonseca", "antonio@email.com", "12345".hashCode()));
			users.add(new User("Julia Alves", "julia@email.com", "1234".hashCode()));
		}
		return users;
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

}
