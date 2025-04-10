package bts.sio.azurimmo.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import bts.sio.azurimmo.model.Utilisateur;
import bts.sio.azurimmo.repository.UtilisateurRepository;
import bts.sio.azurimmo.security.AuthUser;

@Service
public class JpaUserDetailsService implements UserDetailsService {

    private final UtilisateurRepository userRepository;

    public JpaUserDetailsService(UtilisateurRepository userRepository) {
        this.userRepository = userRepository;
    }
    
    @Override
    @Transactional
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Utilisateur user = userRepository.findByEmail(email);
        return new AuthUser(user);
    }
}