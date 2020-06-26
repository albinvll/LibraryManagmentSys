package DAL;

import BLL.Rezervimet;
import java.util.List;

public interface RezervimetInterface {
    void create(Rezervimet r) throws LibraryException;
    void edit(Rezervimet r) throws LibraryException;
    void delete(Rezervimet r)throws LibraryException;
    List<Rezervimet> findAll() throws LibraryException;
}
