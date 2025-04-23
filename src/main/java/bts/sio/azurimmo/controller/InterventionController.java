package bts.sio.azurimmo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import bts.sio.azurimmo.model.Intervention;
import bts.sio.azurimmo.model.Locataire;
import bts.sio.azurimmo.service.InterventionService;

@RestController
@RequestMapping("/api/interventions")
public class InterventionController {
	@Autowired
	private InterventionService interventionService;
	
	
	@GetMapping("/")
	public List<Intervention> getLesInterventions(){
		return interventionService.getLesInterventions();
	}
	
	@PostMapping("/")
	public Intervention createIntervention(@RequestBody Intervention intervention) {
		return interventionService.createIntervention(intervention);
	}
}

