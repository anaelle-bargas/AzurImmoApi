package bts.sio.azurimmo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bts.sio.azurimmo.model.Contrat;
import bts.sio.azurimmo.repository.ContratRepository;
import lombok.Data;

@Data
@Service
public class ContratService {
	@Autowired
	private ContratRepository contratRepository;
	
	public List<Contrat> getLesContrats(){
		return contratRepository.findAll();
	}
	
}
