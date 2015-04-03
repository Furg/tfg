package cat.udl.eps.softarch.hello.service;

import cat.udl.eps.softarch.hello.model.Measure;
import cat.udl.eps.softarch.hello.model.Person;

/**
 * Created by Angel on 02/04/2015.
 */
public interface PersonMeasuresService {

    Person getPersonAndMeasures(String username);

    Measure addMeasureToPerson(Measure measure);

}
