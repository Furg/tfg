package cat.udl.eps.softarch.hello.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import cat.udl.eps.softarch.hello.model.Person;

/**
 * Created by http://rhizomik.net/~roberto/
 */
public interface PersonRepository extends JpaRepository<Person, String> {

    Person findUserByEmail(@Param("email") String email);
}
