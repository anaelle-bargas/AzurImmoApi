package bts.sio.azurimmo.service;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import bts.sio.azurimmo.model.Appartement;
import bts.sio.azurimmo.model.Batiment;
import bts.sio.azurimmo.repository.AppartementRepository;
import bts.sio.azurimmo.repository.BatimentRepository;
import lombok.Data;

@Data
@Service

public class BatimentService {
	
	@Autowired
	private BatimentRepository batimentRepository;
	
	@Autowired
	private AppartementService appartementService;
	
	public Batiment saveBatiment(Batiment batiment) {
		if(batiment.getId()==0) {
			batiment.setId(null);
		}
		Batiment savedBatiment = batimentRepository.save(batiment);
		return savedBatiment;
	}
	
	//public List<Batiment> findByVille(String ville) {
	//	return appartementRepository.findByBatiment_Ville(ville);
	//}
	
	//public List<Batiment> getAppartementsParBatiment(long id) {
		//:/return appartementRepository.findByBatiment_Id(id);
	//}
	
	//public List<Appartement> getAppartementsParSurfacePlusGrandeQue(float surface) {
		//:///return appartementRepository.findBySurfaceGreaterThan(surface);
	//}
	
	public List<Batiment> getBatiments() {
		return batimentRepository.findAll();
	}
	
	//public List<Batiment> findByVille(long idVille){
		//return batimentRepository.findByVille(idVille);
	//}
	
	
	public double getSurfaceBatiment(long id) {
		List<Appartement> lesAppartements = appartementService.getAppartementsParBatiment(id);
		double surfaceTot = 0;
		for (Appartement appartement : lesAppartements) {
		    surfaceTot += appartement.getSurface();
		}
		return surfaceTot;
	}
	
	
	public Optional<Batiment> getBatimentById(Long id) {
		return batimentRepository.findById(id);
	}
	
	public void deleteBatiment(Long id) {
		try {
            if (!batimentRepository.existsById(id)) {
                throw new IllegalArgumentException("Le bâtiment avec l'ID " + id + " n'existe pas.");
            }
            batimentRepository.deleteById(id);
        } catch (EmptyResultDataAccessException e) {
            throw new IllegalArgumentException("Erreur lors de la suppression du bâtiment avec l'ID " + id, e);
        }
	}
	
	public Batiment updateBatiment(Batiment batiment) {
		try {
            if (!batimentRepository.existsById(batiment.getId())) {
                throw new IllegalArgumentException("Le bâtiment avec l'ID " + batiment.getId() + " n'existe pas.");
            }
            Batiment nvBatiment = batimentRepository.save(batiment);
            return nvBatiment;
        } catch (EmptyResultDataAccessException e) {
            throw new IllegalArgumentException("Erreur lors de la suppression du bâtiment avec l'ID " + batiment.getId(), e);
        }
	}
}
