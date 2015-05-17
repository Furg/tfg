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

import java.text.ParseException;
import java.text.SimpleDateFormat;
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

    @Transactional
    @Override
    public void updateMeasureFromPerson(Measure updateMeasure, Long measureId) {
        Measure oldMeasure = measureRepository.findOne(measureId);
        oldMeasure.setDate(updateMeasure.getDate());
        oldMeasure.setComment(updateMeasure.getComment());
        oldMeasure.setFirstCategory(updateMeasure.getFirstCategory());
        oldMeasure.setSecondCategory(updateMeasure.getSecondCategory());
        oldMeasure.setGlucose(updateMeasure.getGlucose());
        oldMeasure.setRations(updateMeasure.getRations());
        oldMeasure.setrInsulin(updateMeasure.getrInsulin());
        oldMeasure.setsInsulin(updateMeasure.getsInsulin());
        oldMeasure.setWeight(updateMeasure.getWeight());
        measureRepository.save(oldMeasure);
    }

    @Transactional
    @Override
    public boolean addMeasureToPerson(Measure m) {
        Person u = personRepository.findOne(m.getUsername());
        boolean result = false;
        ///Controlar si no existeix l'usuari

        try {

            if(isToday(m.getDate())){

                if(u.getTodaysMeasures().size() < 5){
                    u.addExperience(5);
                    result = true;
                }

            }

        } catch (ParseException e) {
            e.printStackTrace();
        }

        measureRepository.save(m);
        u.addMeasure(m);
        personRepository.save(u);
        return result;
    }

    private boolean isToday(Date date) throws ParseException {

        TimeZone timeZone = TimeZone.getTimeZone("GMT+2");
        Calendar calendar = Calendar.getInstance(timeZone);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        simpleDateFormat.setTimeZone(timeZone);
        Date today = simpleDateFormat2.parse(simpleDateFormat.format(calendar.getTime()));
        today.setHours(0);
        today.setMinutes(0);
        today.setSeconds(0);

        return date.after(today);
    }


}
