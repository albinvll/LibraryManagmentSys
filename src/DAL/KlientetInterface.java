package DAL;

import BLL.Klientet;
import java.util.List;

public interface KlientetInterface {
    void create(Klientet h) throws LibraryException;
    void edit(Klientet h) throws LibraryException;
    void delete(Klientet h)throws LibraryException;
    List<Klientet> findAll() throws LibraryException;
}
