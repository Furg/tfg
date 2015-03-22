package cat.udl.eps.softarch.hello.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cat.udl.eps.softarch.hello.model.Greeting;
import cat.udl.eps.softarch.hello.model.Person;
import cat.udl.eps.softarch.hello.repository.GreetingRepository;
import cat.udl.eps.softarch.hello.repository.PersonRepository;

/**
 * Created by http://rhizomik.net/~roberto/
 */
@Service
public class PersonGreetingsServiceImpl implements PersonGreetingsService {
    final Logger logger = LoggerFactory.getLogger(PersonGreetingsServiceImpl.class);

    @Autowired
    GreetingRepository greetingRepository;
    @Autowired
    PersonRepository personRepository;

    @Transactional(readOnly = true)
    @Override
    public Person getPersonAndGreetings(String username) {
        Person u = personRepository.findOne(username);
        logger.info("User {} has {} greetings", u.getUsername(), u.getGreetings().size());
        return u;
    }

    @Transactional
    @Override
    public Greeting addGreetingToPerson(Greeting g) {
        Person u = personRepository.findOne(g.getUsername());
        if (u == null) {
            String username = g.getUsername();
            u = new Person(username, "");
        }
        greetingRepository.save(g);
        u.addGreeting(g);
        personRepository.save(u);
        return g;
    }

    @Transactional
    @Override
    public Greeting updateGreetingFromPerson(Greeting updateGreeting, Long greetingId) {
        Greeting oldGreeting = greetingRepository.findOne(greetingId);
        oldGreeting.setContent(updateGreeting.getContent());
        oldGreeting.setDate(updateGreeting.getDate());
        if (!updateGreeting.getUsername().equals(oldGreeting.getUsername())) {
            throw new GreetingUsernameUpdateException("Greeting username cannot be updated");
        }
        return greetingRepository.save(oldGreeting);
    }

    @Transactional
    @Override
    public void removeGreetingFromPerson(Long greetingId) {
        Greeting g = greetingRepository.findOne(greetingId);
        Person u = personRepository.findOne(g.getUsername());
        if (u != null) {
            u.removeGreeting(g);
            personRepository.save(u);
        }
        greetingRepository.delete(g);
    }
}
