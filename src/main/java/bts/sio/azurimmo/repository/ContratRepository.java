package bts.sio.azurimmo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import bts.sio.azurimmo.model.Contrat;

@Repository
public interface ContratRepository extends JpaRepository<Contrat, Long>{

}
