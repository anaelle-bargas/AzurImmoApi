package bts.sio.azurimmo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import bts.sio.azurimmo.model.Appartement;
import bts.sio.azurimmo.model.Intervention;
import bts.sio.azurimmo.model.Locataire;
import bts.sio.azurimmo.repository.InterventionRepository;
import lombok.Data;

@Data
@Service
public class InterventionService {
	@Autowired
	private InterventionRepository interventionRepository;
	
	public List<Intervention> getLesInterventions(){
		return interventionRepository.findAll();
	}
	
	
	public Intervention createIntervention(Intervention intervention) {
		if(intervention.getId()==0) {
			intervention.setId(null);
		}
		return interventionRepository.save(intervention);
	}
	
	public List<Intervention> getInterventionsParAppartement(long id) {
		return interventionRepository.findByAppartement_Id(id);
	}
	
	public void deleteIntervention(Long id) {
		try {
            if (!interventionRepository.existsById(id)) {
                throw new IllegalArgumentException("Le intervention avec l'ID " + id + " n'existe pas.");
            }
            interventionRepository.deleteById(id);
        } catch (EmptyResultDataAccessException e) {
            throw new IllegalArgumentException("Erreur lors de la suppression du intervention avec l'ID " + id, e);
        }
	}
	
}
