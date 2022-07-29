/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SendMail;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax  .mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
/**
 *
 * @author LENOVO
 */
public class JavaMailUtil {
    public static void sendMail(String recepient, String reason) throws MessagingException{
        System.out.println("Preparing to send email");
        Properties properties= new Properties();
        properties.put("mail.smtp.auth","true");
        properties.put("mail.smtp.starttls.enable","true");
        properties. put("mail.smtp.host", "smtp.gmail.com");
        properties. put("mail.smtp.port","587");
        String myAccountEmail="lostfoundsystemswp391@gmail.com";
        String password="SWP391@LostAndFound@Group5";
        //String reason = "";
        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication(){
                return new PasswordAuthentication(myAccountEmail, password);
            }
        });
        Message message = prepareMessage(session, myAccountEmail,recepient, reason);
        Transport.send(message);
        System.out.println("Message sent Successfully");
}
    private static Message prepareMessage(Session session,String myAccountEmail,String recepient, String reason){
    try{
        Message message= new MimeMessage(session);
        message.setFrom(new InternetAddress(myAccountEmail));
        message.setRecipient(Message.RecipientType.TO,new InternetAddress(recepient) );
        message.setSubject("Announcememnt from ADMIN of FPTU Lost & Found system");
        String htmlCode="<h3>"+reason+"</h3></br>";
        message.setContent(htmlCode, "text/html");
        return message;
    }catch(Exception ex){
        Logger.getLogger(JavaMailUtil.class.getName()).log(Level.SEVERE,null,ex);
    }
    return null;
    }
}
