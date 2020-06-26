package DAL;

import BLL.Roli;
import java.util.List;

public class RoliRepository extends EntMngClass implements RoliInterface{

    @Override
    public List<Roli> findAll() throws LibraryException {
        try{
            return em.createNamedQuery("Roli.findAll").getResultList();
        }catch(Exception e){
            throw new LibraryException("Msg \n"+e.getMessage());
        }
    }
}
