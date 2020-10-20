package store.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import store.entities.Authority;
import store.repositories.AuthorityRepository;

import java.util.Optional;

@Service
public class AuthorityService {
    private AuthorityRepository authorityRepository;

    @Autowired
    public void setRolesRepository(AuthorityRepository authorityRepository) {
        this.authorityRepository = authorityRepository;
    }

    public Optional<Authority> findByAuthority(String authority) {
        return authorityRepository.findByAuthority(authority);
    }
}
