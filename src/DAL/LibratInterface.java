package DAL;

import BLL.Librat;
import java.util.List;

public interface LibratInterface {
    void create(Librat l) throws LibraryException;
    void edit(Librat l) throws LibraryException;
    void delete(Librat l)throws LibraryException;
    List<Librat> findAll() throws LibraryException;
}
