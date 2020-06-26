package DAL;

import BLL.Autoret;
import java.util.List;

public interface AutoretInterface {
    void create(Autoret a) throws LibraryException;
    void edit(Autoret a) throws LibraryException;
    void delete(Autoret a)throws LibraryException;
    List<Autoret> findAll() throws LibraryException;
}
