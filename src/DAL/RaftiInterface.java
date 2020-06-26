package DAL;

import java.util.List;
import BLL.Rafti;

public interface RaftiInterface {
    void create(Rafti r) throws LibraryException;
    void edit(Rafti r) throws LibraryException;
    void delete(Rafti r)throws LibraryException;
    List<Rafti> findAll() throws LibraryException;
}
