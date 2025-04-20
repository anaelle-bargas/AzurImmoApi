package bts.sio.azurimmo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bts.sio.azurimmo.model.Locataire;
import bts.sio.azurimmo.repository.LocataireRepository;
import lombok.Data;

@Data
@Service
public class LocataireService {
	@Autowired
	private LocataireRepository locataireRepository;
	
	public List<Locataire> findAll(){
		return locataireRepository.findAll();
	}
	
	
	public Locataire createLocataire(Locataire locataire) {
		if(locataire.getId()==0) {
			locataire.setId(null);
		}
		return locataireRepository.save(locataire);
	}
}
