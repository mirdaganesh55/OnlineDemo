package com.java.jsf;
import java.util.Date;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

public class PersonController {
	
	private Person person;
	private PersonDAOImpl personDao;
	private Confirmation confirmation;
	private Employment employ;
	
	public Employment getEmploy() {
		return employ;
	}
	public void setEmploy(Employment employ) {
		this.employ = employ;
	}
	public Confirmation getConfirmation() {
		return confirmation;
	}
	public void setConfirmation(Confirmation confirmation) {
		this.confirmation = confirmation;
	}
	public Person getPerson() {
		return person;
	}
	public void setPerson(Person person) {
		this.person = person;
	}
	public PersonDAOImpl getPersonDao() {
		return personDao;
	}
	public void setPersonDao(PersonDAOImpl personDao) {
		this.personDao = personDao;
	}
	
	public 	void savePerson(Person person,Employment employment) {
		personDao.savePersonDao(person,employment);
	}
	public List<Person> getAllPersonRecord(){
		return personDao.getAllPersonRecordDao();
	}
	
	public String addValidConditions(Person person,Employment employment) {
		if(addValid(person)) {
			return personDao.savePersonDao(person,employment);
		}
		return "";
	}
	
	public boolean addValid(Person person) {
		FacesContext context = FacesContext.getCurrentInstance();
//		String fName = "^[A-Za-z\\s]+$";
//		String lName = "^[A-Za-z\\s]+$";
//		String ssn = "\\b\\d{6}\\b";
//		String phoneno = "^(\\+\\d{1,4})?\\d{10}$";
//		String email = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";

		 /* if (!Pattern.matches(fName, person.getFirstName())) {
		  context.addMessage("form:firstName", new
		 FacesMessage("Please enter a valid First Name using only letters.")); flag =
		 false; 
		 }*/
		boolean flag = true;
		if(person.getFirstName().length() <= 0) {
			context.addMessage("form:firstName", new FacesMessage("First name is required."));
			flag = false;
		}
		
		if(person.getLastName().length() <= 0) {
			context.addMessage("form:lastName", new FacesMessage("Last name is required."));
			flag = false;
		}
		if(person.getGender().isEmpty()) {
			context.addMessage("form:gender", new FacesMessage("Please select a gender."));
			flag = false;
		}
		if (person.getSsn().isEmpty()) {
			context.addMessage("form:ssn",new FacesMessage("Enter SSN number"));
			flag = false;
		}
		if (person.getEmail().isEmpty()) {
			context.addMessage("form:email", new FacesMessage("Email is required."));
			flag = false;
		}
		if (person.getPhoneNumber().isEmpty()) {
			context.addMessage("form:phoneNumber", new FacesMessage("Phone number is required"));
			flag = false;
		}
		if(person.getIncome()!= 0) {
			if (person.getIncome() >= 45000 && person.getIncome() <= 500000) {
				flag = true;
			}else {
				context.addMessage("form:income", new FacesMessage("Income must be within the range of 45000 to 500000."));
				flag = false;
			}
		}else {
			context.addMessage("form:income", new FacesMessage("Income cannot be empty"));
			flag = false;
		}
		
		if (person.getAddress().isEmpty()) {
			context.addMessage("form:address", new FacesMessage("Please enter address."));
			flag = false;
		}
		
		if (person.getDateOfBirth() != null) {

			Date userDate = person.getDateOfBirth();
			Date curreDate = new Date();
			if(userDate.after(curreDate)) {
				context.addMessage("form:dateOfBirth", new FacesMessage("Date of birth cannot be future date"));
				flag = false;
			}
			/* Dob should be before 10 dec 2001
		    Date minDate = new Date(2001 - 1900, Calendar.DECEMBER, 10); // Create Date object for December 10, 2001
		    if (userDate.after(minDate)) {
		        context.addMessage("form:dateOfBirth", new FacesMessage("Date of birth must be before December 10, 2001"));
		        flag = false;
		    }*/
		} else {
		    context.addMessage("form:dateOfBirth", new FacesMessage("Date of birth cannot be empty"));
		    flag = false;
		}
		
		return flag;
	}
}
