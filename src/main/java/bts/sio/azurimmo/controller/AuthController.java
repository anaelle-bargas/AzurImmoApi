package bts.sio.azurimmo.controller;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.web.bind.UnsatisfiedServletRequestParameterException;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import bts.sio.azurimmo.dto.RequestLoginDto;
import bts.sio.azurimmo.model.Utilisateur;
import bts.sio.azurimmo.repository.UtilisateurRepository;
import bts.sio.azurimmo.security.AuthUser;
import bts.sio.azurimmo.service.AuthService;
import bts.sio.azurimmo.service.JpaUserDetailsService;

@RestController
@RequestMapping("/auth")
public class AuthController {
	
	@Autowired
	private UtilisateurRepository utilisateurRepository;
	
	@Autowired
	private JpaUserDetailsService userDetailsService;
	
	@Autowired
	private AuthenticationManager authenticationManager;
	
	@Autowired
	private AuthService authService;
	
	@PostMapping("/register")
	public ResponseEntity<Utilisateur> register(@RequestBody Utilisateur utilisateur) {
		try {
			utilisateurRepository.save(utilisateur);
			return ResponseEntity.ok(utilisateur);
		}catch(Exception e) {
			
		}
		return ResponseEntity.badRequest().build();	
	
	}
	
	
	@PostMapping("/login")
	public ResponseEntity<String> login(@RequestBody RequestLoginDto userRequest){
		Authentication authentication = authenticationManager.authenticate(
			new UsernamePasswordAuthenticationToken(userRequest.getEmail(), userRequest.getPassword())
		);
		
		if(authentication.isAuthenticated()) {
			SecurityContextHolder.getContext().setAuthentication(authentication);
			String token= authService.generateToken(authentication);
			return ResponseEntity.ok(token);
		}
		
		
		
		return ResponseEntity.badRequest().build();				
	}
	
	
}
