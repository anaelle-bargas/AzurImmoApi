package bts.sio.azurimmo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import bts.sio.azurimmo.model.TypeIntervention;
import bts.sio.azurimmo.service.TypeInterventionService;

@RestController
@RequestMapping("/api/type_interventions")
public class TypeInterventionController {
	@Autowired
	private TypeInterventionService typeInterventionService;
	
	
	@GetMapping("/")
	public List<TypeIntervention> getLesTypeInterventions(){
		return typeInterventionService.getLesTypeInterventions();
	}
	
	@PostMapping("/")
	public TypeIntervention addTypeIntervention(@RequestBody TypeIntervention typeIntervention){
		return typeInterventionService.createTypeIntervention(typeIntervention);
	}
}

