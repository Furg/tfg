package cat.udl.eps.softarch.hello.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import cat.udl.eps.softarch.hello.model.Person;
import cat.udl.eps.softarch.hello.repository.PersonRepository;

/**
 * Created by roberto on 14/01/15.
 */
public class RepositoryUserDetailsService implements UserDetailsService {

    private PersonRepository repository;

    @Autowired
    public RepositoryUserDetailsService(PersonRepository repository) {
        this.repository = repository;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Person user = repository.findOne(username);
        if (user == null)
            throw new UsernameNotFoundException("No user found with username: " + username);
        return user;
    }
}
