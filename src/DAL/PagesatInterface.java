package DAL;

import BLL.Pagesat;
import java.util.List;

public interface PagesatInterface {
    void create(Pagesat a) throws LibraryException;
    void edit(Pagesat a) throws LibraryException;
    void delete(Pagesat a)throws LibraryException;
    List<Pagesat> findAll() throws LibraryException;
}
