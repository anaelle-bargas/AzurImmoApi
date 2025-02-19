package bts.sio.azurimmo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import bts.sio.azurimmo.model.Contrat;
import bts.sio.azurimmo.service.ContratService;

@RestController
@RequestMapping("/api/contrats")
public class ContratController {
	@Autowired
	private ContratService contratService;
	
	
	@GetMapping("/")
	public List<Contrat> getLesContrats(){
		return contratService.getLesContrats();
	}
}
