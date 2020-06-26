package DAL;

public class LibraryException extends Exception{
    public LibraryException(String msg){
        super(msg);
    }
    
    @Override
    public String toString(){
        return this.getLocalizedMessage();
    }
}
