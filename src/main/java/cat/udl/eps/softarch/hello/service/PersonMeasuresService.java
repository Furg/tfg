package cat.udl.eps.softarch.hello.service;

import cat.udl.eps.softarch.hello.model.Measure;
import cat.udl.eps.softarch.hello.model.Person;

import java.util.List;

/**
 * Created by Angel on 02/04/2015.
 */
public interface PersonMeasuresService {

    Person getPersonAndMeasures(String username);

    List<Measure> getPersonMeasures(String username);

    boolean addMeasureToPerson(Measure measure);

    void updateMeasureFromPerson(Measure measure, Long id);
}
