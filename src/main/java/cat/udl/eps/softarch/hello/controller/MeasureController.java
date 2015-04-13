package cat.udl.eps.softarch.hello.controller;

import java.util.Date;
import cat.udl.eps.softarch.hello.model.Measure;
import cat.udl.eps.softarch.hello.repository.MeasureRepository;
import cat.udl.eps.softarch.hello.service.PersonMeasuresService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import java.util.Calendar;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

/**
 * Created by Angel on 02/04/2015.
 */

@Controller
@RequestMapping(value = "/measures")
public class MeasureController {
    final Logger logger = LoggerFactory.getLogger(MeasureController.class);

    @Autowired MeasureRepository measureRepository;

    @Autowired
    PersonMeasuresService personMeasuresService;

// CREATE
    @RequestMapping(method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    @ResponseBody
    public Measure create(@Valid @RequestBody Measure measure) {
        logger.info("Creating measure with weight'{}'", measure.getWeight());
        Measure newMeasure = personMeasuresService.addMeasureToPerson(measure);
        return newMeasure;
    }

    @RequestMapping(method = RequestMethod.POST, consumes = "application/x-www-form-urlencoded", produces="text/html")
    public String createHTML(@Valid @ModelAttribute("measure") Measure measure, BindingResult binding, HttpServletResponse response){
        if(binding.hasErrors()){
            logger.info("Validation error: {}", binding);
            return "measureform";
        }
        return "redirect:/users/"+create(measure).getUsername();
    }

    // Create form
    @RequestMapping(value = "/form", method = RequestMethod.GET, produces = "text/html")
    public ModelAndView createForm() {
        logger.info("Generating form for measure creation");
        Measure emptyMeasure = new Measure();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        emptyMeasure.setUsername(auth.getName());
        emptyMeasure.setDate(Calendar.getInstance().getTime());
        return new ModelAndView("measureform","measure",emptyMeasure);
    }



}
