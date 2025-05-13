package bts.sio.azurimmo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import bts.sio.azurimmo.model.Batiment;
import bts.sio.azurimmo.model.Contrat;
import bts.sio.azurimmo.model.Intervention;
import bts.sio.azurimmo.repository.ContratRepository;
import lombok.Data;

@Data
@Service
public class ContratService {
	@Autowired
	private ContratRepository contratRepository;
	
	public List<Contrat> getLesContrats(){
		return contratRepository.findByArchiveFalse();
	}
	
	
	public Contrat saveContrat(Contrat contrat) {
		if(contrat.getId()==0) {
			contrat.setId(null);
		}
		Contrat savedContrat = contratRepository.save(contrat);
		return savedContrat;
	}
	
	public Optional<Contrat> getContratById(Long id) {
		return contratRepository.findById(id);
	}
	
	
	public void deleteContrat(Long id) {
		try {
            if (!contratRepository.existsById(id)) {
                throw new IllegalArgumentException("Le contrat avec l'ID " + id + " n'existe pas.");
            }
            contratRepository.deleteById(id);
        } catch (EmptyResultDataAccessException e) {
            throw new IllegalArgumentException("Erreur lors de la suppression du contrat avec l'ID " + id, e);
        }
	}
	
	public Contrat updateContrat(Contrat contrat) {
		try {
            if (!contratRepository.existsById(contrat.getId())) {
                throw new IllegalArgumentException("Le contrat avec l'ID " + contrat.getId() + " n'existe pas.");
            }
            Contrat nvContrat = contratRepository.save(contrat);
            return nvContrat;
        } catch (EmptyResultDataAccessException e) {
            throw new IllegalArgumentException("Erreur lors de la suppression du contrat avec l'ID " + contrat.getId(), e);
        }
	}
	
	public List<Contrat> getContratsParAppartement(long id) {
		return contratRepository.findByAppartement_IdAndArchiveFalse(id);
	}
	
	public List<Contrat> getLesContratsAvecArchives() {
		return contratRepository.findAll();
	}
}
