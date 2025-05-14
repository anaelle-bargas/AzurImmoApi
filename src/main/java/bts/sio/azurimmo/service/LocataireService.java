package bts.sio.azurimmo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import bts.sio.azurimmo.model.Contrat;
import bts.sio.azurimmo.model.Intervention;
import bts.sio.azurimmo.model.Locataire;
import bts.sio.azurimmo.repository.LocataireRepository;
import lombok.Data;

@Data
@Service
public class LocataireService {
	@Autowired
	private LocataireRepository locataireRepository;
	
	public List<Locataire> findAll(){
		return locataireRepository.findByArchiveFalse();
	}
	
	
	public Locataire createLocataire(Locataire locataire) {
		if(locataire.getId()==0) {
			locataire.setId(null);
		}
		return locataireRepository.save(locataire);
	}
	
	public void deleteLocataire(Long id) {
		try {
            if (!locataireRepository.existsById(id)) {
                throw new IllegalArgumentException("Le locataire avec l'ID " + id + " n'existe pas.");
            }
            locataireRepository.deleteById(id);
        } catch (EmptyResultDataAccessException e) {
            throw new IllegalArgumentException("Erreur lors de la suppression du locataire avec l'ID " + id, e);
        }
	}
	
	public List<Locataire> getLesLocatairesAvecArchives() {
		return locataireRepository.findAll();
	}
	
	public void archiverLocataire(Long id) {
		Locataire locataire = locataireRepository.findById(id)
	        .orElseThrow(() -> new RuntimeException("Locataire non trouvé"));
		locataire.setArchive(true);
		locataireRepository.save(locataire);
	    
	}
}
