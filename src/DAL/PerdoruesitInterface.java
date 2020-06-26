package DAL;

import BLL.Perdoruesit;
import java.util.List;

public interface PerdoruesitInterface {
    void create(Perdoruesit p) throws LibraryException;
    void edit(Perdoruesit p) throws LibraryException;
    void delete(Perdoruesit p) throws LibraryException;
    List<Perdoruesit> findAll() throws LibraryException;
    Perdoruesit findByID(Integer ID) throws LibraryException;
    Perdoruesit findByOnline() throws LibraryException;
    Perdoruesit loginByUsernameAndPassword(String u, String p) throws LibraryException;
}

