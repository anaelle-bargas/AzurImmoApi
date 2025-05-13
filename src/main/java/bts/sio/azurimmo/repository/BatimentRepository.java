package bts.sio.azurimmo.repository;
import org.springframework.stereotype.Repository;
import bts.sio.azurimmo.model.Batiment;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

@Repository
public interface BatimentRepository extends JpaRepository<Batiment, Long>{
	
	//List<Batiment> findByVille(long id);
	List<Batiment> findByArchiveFalse();

}


