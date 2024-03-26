package com.java.jsf;

import java.io.Serializable;

public class Confirmation implements Serializable {
	
    private static final long serialVersionUID = 1L;
    private Person person;
    
	public Person getPerson() {
		return person;
	}
	public void setPerson(Person person) {
		this.person = person;
	}
    
	
}
