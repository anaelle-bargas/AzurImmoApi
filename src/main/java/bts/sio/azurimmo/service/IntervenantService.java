package bts.sio.azurimmo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bts.sio.azurimmo.model.Appartement;
import bts.sio.azurimmo.model.Intervenant;
import bts.sio.azurimmo.repository.IntervenantRepository;
import lombok.Data;

@Data
@Service
public class IntervenantService {
	@Autowired
	private IntervenantRepository intervenantRepository;
	
	public List<Intervenant> getLesIntervenants(){
		return intervenantRepository.findAll();
	}
	
	public Intervenant createIntervenant(Intervenant intervenant) {
		if(intervenant.getId()==0) {
			intervenant.setId(null);
		}
		Intervenant savedIntervenant = intervenantRepository.save(intervenant);
		return savedIntervenant;
	}
	
}
