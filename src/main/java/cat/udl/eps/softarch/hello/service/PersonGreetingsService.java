package cat.udl.eps.softarch.hello.service;

import cat.udl.eps.softarch.hello.model.Greeting;
import cat.udl.eps.softarch.hello.model.Person;

/**
 * Created by http://rhizomik.net/~roberto/
 */
public interface PersonGreetingsService {
    Person getPersonAndGreetings(String username);

    Greeting addGreetingToPerson(Greeting greeting);

    Greeting updateGreetingFromPerson(Greeting updateGreeting, Long greetingId);

    void removeGreetingFromPerson(Long greetingId);
}
