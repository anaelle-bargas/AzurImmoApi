package bts.sio.azurimmo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import bts.sio.azurimmo.model.Intervenant;

@Repository
public interface IntervenantRepository extends JpaRepository<Intervenant, Long>{

}
