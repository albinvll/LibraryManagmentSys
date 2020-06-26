package GUILogic;

import BLL.Librat;
import BLL.Perdoruesit;
import BLL.Rezervimet;
import DAL.JavaMailUtil;
import DAL.LibraryException;
import DAL.LibratRepository;
import DAL.PerdoruesitRepository;
import DAL.RezervimetRepository;
import java.net.URL;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.image.ImageView;
import javafx.scene.input.KeyCode;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

public class LoginController implements Initializable {
    @FXML
    private TextField Email_field;
    @FXML
    private PasswordField Password_field;
    @FXML 
    private ImageView backgroundPane;
    @FXML
    private AnchorPane centerPane;
    
    PerdoruesitRepository pr = new PerdoruesitRepository();
    private LibratRepository lr = new LibratRepository();
    private RezervimetRepository rr = new RezervimetRepository();

    /**
     * Initializes the controller class.
     * @param url
     * @param rb
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
        turnOnlineOff();
        dergoEmail();
        
    }   
    
    public void turnOnlineOff(){
        try{
            List<Perdoruesit> perdoruesi = pr.findAll();
            
            for(Perdoruesit p : perdoruesi){
                p.setOnline(false);
                pr.edit(p);
            }
            
        }catch(Exception e){
            
        }
    }
    
    public void dergoEmail(){
        try{
        List<Librat> libri = lr.findAll();
        List<Rezervimet> rezervimi = rr.findByAktiv();
        
        List<Rezervimet> res = new ArrayList<Rezervimet>();
        
        for(Librat l :libri){
            if(l.getELire()==true){
            for(Rezervimet r :rezervimi){
                if(r.getLibratID().equals(l)){
                    res.add(r);
                    r.setAktiv(false);
                    rr.edit(r);
                    break;
                }
            }
            }
        }
        
        for(Rezervimet r:res){
            JavaMailUtil.sendEmail(r.getKlientetID().getEmail(), r);
        }
        }catch(Exception e){
        }
    }
    
    
    
    @FXML
    public void LoginButton(){
        try{
            PerdoruesitRepository pr = new PerdoruesitRepository();
            Perdoruesit p = pr.loginByUsernameAndPassword(Email_field.getText(), hash(Password_field.getText()));
            String[] fields = {(Email_field.getText()),(Password_field.getText())};
            for(String s : fields){
                if(s.trim().isEmpty() || s == null) throw new LibraryException("Njera prej fushave eshte e zbrazet, ju lutem rishikoni shkrimet e juaja!");                
            }
            if(!Email_field.getText().matches("(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])")) 
                throw new LibraryException("Formati i E-mail eshte gabim. Ju lutem rishikoni perseri!");
            if(p!=null){
                if(p.getRoliID().getRoliID()==2){
                    p.setOnline(true);
                    pr.edit(p);
                    
                Parent root = FXMLLoader.load(getClass().getResource("/GUIView/MainPane.fxml"));
                Scene scene = new Scene(root);
                Stage stage = (Stage)((Node)Email_field).getScene().getWindow();
                
                stage.setScene(scene);
                stage.setX(-8);
                stage.setY(-5);
                stage.show();
                }else if(p.getRoliID().getRoliID()==1){
                    p.setOnline(true);
                    pr.edit(p);
                    Parent root = FXMLLoader.load(getClass().getResource("/GUIView/MainPaneAdmin.fxml"));
                Scene scene = new Scene(root);
                Stage stage = (Stage)((Node)Email_field).getScene().getWindow();
                stage.setScene(scene);
                stage.setX(-8);
                stage.setY(-5);
                stage.show();
                }
            }
        }catch(Exception e){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setContentText(e.toString());
            alert.show();
            clear();
            clearFocus();
        }
    }
    
    @FXML
    public void Enter(){
        try{
            Email_field.getScene().setOnKeyPressed(e -> {
            if (e.getCode() == KeyCode.ENTER) {
                LoginButton();
        }
        });
        }catch(Exception e){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("");
            alert.setContentText(e.toString());
            alert.show();
        }
    }
    
    
    public void clear(){
        Password_field.setText(null);
    }
    
    @FXML
    public void clearFocus(){
        centerPane.requestFocus();
    }
    
    private static String hash(String passwordToHash){
        String generatedPassword = null;
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(passwordToHash.getBytes());
            byte[] bytes = md.digest();
            StringBuilder sb = new StringBuilder();
            for(int i=0; i< bytes.length ;i++)
            {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            generatedPassword = sb.toString();
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        return generatedPassword;
    }
}
