package com.java.jsf;

import java.util.List;
import java.util.Random;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

public class PersonDAOImpl implements PersonDAO {

	SessionFactory sf;
	Session session;
	
	public static int generateOtp() {
		Random r = new Random(System.currentTimeMillis());
		return ((1 + r.nextInt(2)) * 10000 + r.nextInt(10000));
	}
	
	int nextId = 0;
	public  int getNextPersonId() {
		sf = SessionHelper.getConnection();
		session = sf.openSession();
		try {
			Criteria criteria = session.createCriteria(Person.class);
			criteria.setProjection(Projections.max("personId"));
			Integer maxId = (Integer) criteria.uniqueResult();
			 if (maxId == null) {
	                return 1; // If no records, start from 1
	            } else {
	                return maxId + 1; // Increment the maxId
	            }
		}
		finally {
			System.out.println("Generated the personID");
		}
	}
	
	@Override
	public String savePersonDao(Person person, Employment employment) {
	    SessionFactory sf = SessionHelper.getConnection();
	    Session session = sf.openSession();
	    Transaction trans = session.beginTransaction();
	    String msg = "Your Form Submitted Successfully";
	    int genId = getNextPersonId();
	    person.setSuccessMessage(msg);
	    person.setPersonId(genId);
	    session.save(person);
	    System.out.println(person);
	    trans.commit();
	    System.out.println("From Save " + person.getPersonId());
	    session.close();

	    if (person.getIsEmployed() == true) {
	        session = sf.openSession();
	        Transaction transaction = session.beginTransaction();
	        employment.setPersonId(person.getPersonId());
	        System.out.println("Person Id " + person.getPersonId());
	        session.save(employment);
	        transaction.commit();
	        session.close();
	    }
	    String recipientEmail = person.getEmail();
        MedicaidApplicationReminder.sendMedicaidApplicationReminder(recipientEmail, "professional.ganesh237@gmail.com", "C:\\Users\\ganeshmi\\Downloads\\images\\dresses\\medicaid_application_header.jpg",person);
        System.out.println("Email "+recipientEmail);
        return "Home.jsp?faces-redirect=true";
	}

	@Override
	public Person updatePersonRecordDao(Person person) {
		sf = SessionHelper.getConnection();
		session = sf.openSession();
		Criteria criteria = session.createCriteria(Person.class);
		List<Person> list =  criteria.list();
		return (Person) list;
	}
	
	@Override
	public List<Person> getAllPersonRecordDao() {
		sf = SessionHelper.getConnection();
		session = sf.openSession();
		Criteria cr = session.createCriteria(Person.class);
		List<Person> personList = cr.list();
		System.out.println(personList);
		return personList;
	}

	@Override
	public String personLogin(PersonRegister personRegister) {
		sf = SessionHelper.getConnection();
		session = sf.openSession();
		Transaction transaction = session.beginTransaction();
		Criteria criteria = session.createCriteria(PersonRegister.class);
		criteria.add(Restrictions.eq("username", personRegister.getUsername()));
		criteria.setProjection(Projections.rowCount());
		long userNameCount = (long) criteria.uniqueResult();
		System.out.println(userNameCount);
		if(userNameCount > 0) {
			System.out.println("Not done");
			FacesContext.getCurrentInstance().addMessage("form:userName",
					new FacesMessage("Username already exist"));
			return "PersonRegistration.jsp?faces-redirect=true";
		}
		System.out.println("If inside");
		int otp = generateOtp();
		personRegister.setOtp(String.valueOf(otp));
		session.save(personRegister);
		transaction.commit();
		String subject = "Welcome to Medicaid Application";
		String body = "Welcome to Mr/Miss  " + personRegister.getName() + "\r\n" + "Your OTP Generated Successfully..."
				+ "\r\n" + "OTP is " + otp;
		MailSend.mailOtp(personRegister.getEmail(), "Otp Send Successfully...", body);
		return "Login.jsp?faces-redirect=true";
	}

	@Override
	public String Login(PersonRegister personRegister) {
		sf = SessionHelper.getConnection();
		session = sf.openSession();
		Criteria criteria = session.createCriteria(PersonRegister.class);
		criteria.add(Restrictions.eq("username", personRegister.getUsername()));
		criteria.add(Restrictions.eq("password", personRegister.getPassword()));
		criteria.setProjection(Projections.rowCount());
		long count = (long) criteria.uniqueResult();
		if(count == 1) {
			return "Home.jsp?faces-redirect=true";
		}
		return "Login.jsp?faces-redirect=true";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
