package cat.udl.eps.softarch.hello.service;


import cat.udl.eps.softarch.hello.model.Measure;
import cat.udl.eps.softarch.hello.model.Person;
import cat.udl.eps.softarch.hello.model.QTest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import cat.udl.eps.softarch.hello.repository.MeasureRepository;
import cat.udl.eps.softarch.hello.repository.PersonRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

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

    @Transactional(readOnly = true)
    @Override
    public List<Measure> getPersonMeasures(String username){
        Person u = personRepository.findOne(username);
        logger.info("User {} has {} measures", u.getUsername(), u.getMeasures().size());
        Collections.sort(u.getMeasures());
        return u.getMeasures();
    }

    @Transactional(readOnly = true)
    @Override
    public List<Measure> getTodayMeasures (String username){
        Person u = personRepository.findOne(username);
        List<Measure> todayMeasures = new ArrayList<Measure>();
        Calendar c = Calendar.getInstance();

        // set the calendar to start of today
        c.set(Calendar.HOUR_OF_DAY, 0);
        c.set(Calendar.MINUTE, 0);
        c.set(Calendar.SECOND, 0);

        // and get that as a Date
        Date today = c.getTime();

        for(Iterator<Measure> i = u.getMeasures().iterator(); i.hasNext(); ) {
            Measure item = i.next();
            if(item.getDate().after(today)){
                todayMeasures.add(item);
            }
        }

        logger.info("User {} has {} today's measures", u.getUsername(), todayMeasures.size());

        Collections.sort(todayMeasures);

        return todayMeasures;
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
