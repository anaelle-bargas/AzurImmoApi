package bts.sio.azurimmo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import bts.sio.azurimmo.model.Contrat;
import bts.sio.azurimmo.model.Intervention;

@Repository
public interface ContratRepository extends JpaRepository<Contrat, Long>{
	List<Contrat> findByAppartement_IdAndArchiveFalse(long id);
	List<Contrat> findByArchiveFalse();
}
