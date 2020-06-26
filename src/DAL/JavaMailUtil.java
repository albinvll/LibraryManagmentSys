package DAL;

import BLL.Rezervimet;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class JavaMailUtil {
    
    public static void sendEmail(String recepient,Rezervimet r) throws MessagingException{
        Properties properties = new Properties();
        
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        
        String myAccount = "projektilibrary@gmail.com";
        String password = "projektilibrary123";
        String libri = r.getLibratID().getTitulli();
        
        
        Session session = Session.getInstance(properties, new Authenticator(){
           @Override
           protected PasswordAuthentication getPasswordAuthentication(){
               return new PasswordAuthentication(myAccount,password);
           }
        });
        
        Message message = prepareMessage(session,myAccount,recepient,libri);
        
        Transport.send(message);
    }

    private static Message prepareMessage(Session session,String myAccount,String recepient,String libri) {
        try{
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(myAccount));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(recepient));
            message.setSubject("Rezervimi i librit");
            message.setText("Pershendetje, Ju informojme se librin "+libri+" qe keni rezervuar tashme eshte i lire dhe mund te vini ta merrni");
            return message;
        }catch(Exception e){
        }
        return null;
    }
}
