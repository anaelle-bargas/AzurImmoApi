package bts.sio.azurimmo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bts.sio.azurimmo.model.TypeIntervention;
import bts.sio.azurimmo.repository.TypeInterventionRepository;
import lombok.Data;

@Data
@Service
public class TypeInterventionService {

	@Autowired
	private TypeInterventionRepository typeInterventionRepository;
	
	public TypeIntervention createTypeIntervention(TypeIntervention typeIntervention) {
		if(typeIntervention.getId()==0) {
			typeIntervention.setId(null);
		}
		TypeIntervention savedTypeIntervention = typeInterventionRepository.save(typeIntervention);
		return savedTypeIntervention;
	}
	
	public List<TypeIntervention> getLesTypeInterventions(){
		return typeInterventionRepository.findAll();
	}
	
	
	
}
