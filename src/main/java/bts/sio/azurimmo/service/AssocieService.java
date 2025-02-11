package bts.sio.azurimmo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bts.sio.azurimmo.model.Associe;
import bts.sio.azurimmo.repository.AssocieRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.Data;

@Data
@Service
public class AssocieService {
	@Autowired
	private AssocieRepository associeRepository;
	
	public List<Associe> getLesAssocies() {
		return associeRepository.findAll();
	}
	
	
	public Optional<Associe> getAssocie(Long id) {
		return associeRepository.findById(id);
	}
	
	public Associe modifyAssocie(Associe updatedAssocie) {
        return associeRepository.save(updatedAssocie);
        
    }
}
