package cat.udl.eps.softarch.hello.controller;

import java.security.Principal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import cat.udl.eps.softarch.hello.model.Measure;
import cat.udl.eps.softarch.hello.model.Person;
import cat.udl.eps.softarch.hello.repository.MeasureRepository;
import cat.udl.eps.softarch.hello.service.PersonMeasuresService;
import com.google.common.base.Preconditions;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Calendar;
import java.util.TimeZone;

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

    // LIST
    @RequestMapping(method = RequestMethod.GET, produces = "text/html")
    public ModelAndView listHTML(Principal principal) {

        ModelAndView modelAndView = new ModelAndView("measures",
                                                     "mymeasures",
                                                      personMeasuresService.getPersonMeasures(principal.getName()));

        return modelAndView;
    }

    // CREATE
    @RequestMapping(value = "/form", method = RequestMethod.POST,
                    consumes = "application/x-www-form-urlencoded",
                    produces="text/html")
    public ModelAndView createHTML(@Valid @ModelAttribute("measure") Measure measure,
                                   BindingResult binding, HttpServletResponse response,
                                   ModelAndView modelAndView,
                                   RedirectAttributes redirectAttributes){
        if(binding.hasErrors()){
            logger.info("Validation error: {}", binding);
            modelAndView.setViewName("measureform");
            return modelAndView;
        }

        logger.info("Creating measure with weight'{}'", measure.getWeight());

        Person user = personMeasuresService.getPersonAndMeasures(measure.getUsername());
        int preExp = user.getPercent();
        int actualExp;

        redirectAttributes.addFlashAttribute("level",user.getLevel());
        redirectAttributes.addFlashAttribute("preExp",preExp);

        boolean gainExp = personMeasuresService.addMeasureToPerson(measure);

        user = personMeasuresService.getPersonAndMeasures(measure.getUsername());
        actualExp = user.getPercent();

        //To prevent a sync error
        if(gainExp && actualExp == preExp){
            actualExp = preExp + 5;
            if(actualExp > 100){
                actualExp = actualExp - 100;
            }
        }

        redirectAttributes.addFlashAttribute("actualExp",actualExp);
        redirectAttributes.addFlashAttribute("completed",true);
        redirectAttributes.addFlashAttribute("gainExp",gainExp);
        modelAndView.setViewName("redirect:/users/"+measure.getUsername());
        return modelAndView;
    }

    // Create form
    @RequestMapping(value = "/form", method = RequestMethod.GET, produces = "text/html")
    public ModelAndView createForm() {
        logger.info("Generating form for measure creation");
        Measure emptyMeasure = new Measure();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        emptyMeasure.setUsername(auth.getName());

        TimeZone timeZone = TimeZone.getTimeZone("GMT+2");
        Calendar calendar = Calendar.getInstance(timeZone);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        simpleDateFormat.setTimeZone(timeZone);
        String currentDateTime = simpleDateFormat.format(calendar.getTime());


        ModelAndView modelAndView = new ModelAndView("measureform","measure",emptyMeasure);
        modelAndView.addObject("currentDateTime", currentDateTime);

        return modelAndView;
    }

    // UPDATE
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    public void update(@PathVariable("id") Long id, @Valid @RequestBody Measure measure) {
        logger.info("Updating measure {}", id);
        Preconditions.checkNotNull(measureRepository.findOne(id), "Measure with id %s not found", id);
        personMeasuresService.updateMeasureFromPerson(measure, id);
    }
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST, consumes = "application/x-www-form-urlencoded")
    @ResponseStatus(HttpStatus.OK)
    public String updateHTML(@PathVariable("id") Long id, @Valid @ModelAttribute("greeting") Measure measure,
                             BindingResult binding, Principal principal) {
        if (binding.hasErrors()) {
            logger.info("Validation error: {}", binding);
            return "form";
        }

        Preconditions.checkArgument(checkIsOwner(principal.getName(),measure),"El control con id %s no pertenece al usuario actual.", id);

        update(id, measure);

        return "redirect:/measures";
    }

    // Update form
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET, produces = "text/html")
    public ModelAndView updateForm(@PathVariable("id") Long id, Principal principal) {
        logger.info("Generating form for updating measure number {}", id);

        Preconditions.checkNotNull(measureRepository.findOne(id),
                                   "Measure with id %s not found", id);

        Measure measure = measureRepository.findOne(id);

        Preconditions.checkArgument(checkIsOwner(principal.getName(),measure),
                                    "El control con id %s no pertenece al usuario actual.", id);

        return new ModelAndView("measureform", "measure", measure);
    }

    private boolean checkIsOwner(String username, Measure measure) {
        return measure.getUsername().equals(username);
    }


}
