package cat.udl.eps.softarch.hello.service;


import cat.udl.eps.softarch.hello.model.Measure;
import cat.udl.eps.softarch.hello.model.Person;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import cat.udl.eps.softarch.hello.repository.MeasureRepository;
import cat.udl.eps.softarch.hello.repository.PersonRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Angel on 02/04/2015.
 */
@Service
public class PersonMeasuresServiceImpl implements PersonMeasuresService {
    final Logger logger = LoggerFactory.getLogger(PersonMeasuresServiceImpl.class);

    @Autowired
    MeasureRepository measureRepository;

    @Autowired
    PersonRepository personRepository;

    @Transactional(readOnly = true)
    @Override
    public Person getPersonAndMeasures(String username){
        Person u = personRepository.findOne(username);
        logger.info("User {} has {} measures", u.getUsername(), u.getMeasures().size());
        return u;
    }


    @Transactional
    @Override
    public Measure addMeasureToPerson(Measure m) {
        Person u = personRepository.findOne(m.getUsername());
        ///Controlar si no existeix l'usuari

        measureRepository.save(m);
        u.addMeasure(m);
        personRepository.save(u);
        return m;
    }

}
