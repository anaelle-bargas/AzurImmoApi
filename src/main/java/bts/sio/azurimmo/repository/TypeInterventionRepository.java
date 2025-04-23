package bts.sio.azurimmo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import bts.sio.azurimmo.model.TypeIntervention;

@Repository
public interface TypeInterventionRepository extends JpaRepository<TypeIntervention, Long>{
	
	
}
