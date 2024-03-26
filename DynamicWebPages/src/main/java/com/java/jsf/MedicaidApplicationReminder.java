package com.java.jsf;

import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class MedicaidApplicationReminder {

    Person person = new Person();
    String from = "professional.ganesh237@gmail.com";
    String imagePath = "C:\\Users\\ganeshmi\\Downloads\\images\\dresses\\medicaid_application_header.jpg";

    public static void sendMedicaidApplicationReminder(String toEmail, String from, String imagePath,Person person) {
        String subject = "Reminder: Medicaid Application Deadline Approaching";
        String body = generateReminderBody(person);

        // Send reminder email
        sendEmail(toEmail, subject, body, from, imagePath,person);
    }

    private static String generateReminderBody(Person person) {
        String body = "<html>" +
                "<head>" +
                "<style>" +
                "body {" +
                "font-family: 'Helvetica', 'Arial', sans-serif;" +
                "line-height: 1.6;" +
                "margin: 0;" +
                "padding: 0;" +
                "background-color: #f9f9f9;" +
                "}" +
                ".container {" +
                "max-width: 600px;" +
                "margin: 20px auto;" +
                "padding: 30px;" +
                "background-color: #ffffff;" +
                "box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);" +
                "border-radius: 10px;" +
                "}" +
                "h1 {" +
                "color: #333333;" +
                "font-size: 24px;" +
                "}" +
                "p {" +
                "color: #555555;" +
                "font-size: 16px;" +
                "margin-bottom: 20px;" +
                "}" +
                "</style>" +
                "</head>" +
                "<body>" +
                "<div class='container'>" +
                "<img src='cid:image' style='max-width: 100%; height: auto; display: block; margin-top: 20px;' alt='Image'/>" +
                "<h1>Dear <span style='color: #FAFA14;'>" + person.getFirstName() + " " + person.getLastName() + "</span></h1>" +
                "<p>We hope this message finds you well.</p>" +
                "<p>This is a friendly reminder that the deadline for your Medicaid application is approaching soon.</p>" +
                "<p>Please ensure that all necessary documents are submitted before the deadline to avoid any delays in processing your application.</p>" +
                "<p>Thank you for your attention to this matter.</p>" +
                "<p>Best regards,</p>" +
                "<p style=\"color: #09EAC8;\">HEALTH CARE</p>" +
                "</div>" +
                "</body>" +
                "</html>";

        return body;
    }

    private static void sendEmail(String toEmail, String subject, String body, String from, String imagePath, Person person) {
        String host = "smtp.gmail.com";

        // Get the system properties
        Properties properties = System.getProperties();

        // Setting important information to properties object
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");

        // Step 1: Get the session object
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("professional.ganesh237@gmail.com", "yicauyiftohuphuw");
            }
        });

        session.setDebug(true);

        // Step 2: Compose the message [text, multimedia]
        MimeMessage mimeMessage = new MimeMessage(session);

        try {
            // Set the from email
            mimeMessage.setFrom(new InternetAddress(from));

            // Add recipient to the message
            mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));

            // Add subject to the message
            mimeMessage.setSubject(subject);

            // Create MimeMultipart for mixed content
            MimeMultipart mixedMultipart = new MimeMultipart("mixed");

            // Create MimeMultipart for related content (HTML + Image)
            MimeMultipart relatedMultipart = new MimeMultipart("related");

            // Create MimeBodyPart for the HTML content
            MimeBodyPart htmlPart = new MimeBodyPart();
            htmlPart.setContent(body, "text/html");
            relatedMultipart.addBodyPart(htmlPart);

            // Create MimeBodyPart for the image
            MimeBodyPart imagePart = new MimeBodyPart();
            DataSource fds = new FileDataSource(imagePath);
            imagePart.setDataHandler(new DataHandler(fds));
            imagePart.setHeader("Content-ID", "<image>");
            relatedMultipart.addBodyPart(imagePart);

            // Create MimeBodyPart for the related content
            MimeBodyPart relatedBodyPart = new MimeBodyPart();
            relatedBodyPart.setContent(relatedMultipart);

            // Add relatedBodyPart to mixedMultipart
            mixedMultipart.addBodyPart(relatedBodyPart);

            // Set the content of the message
            mimeMessage.setContent(mixedMultipart);

            // Step 3: Send the message using Transport class
            Transport.send(mimeMessage);

            System.out.println("Sent successfully.");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
