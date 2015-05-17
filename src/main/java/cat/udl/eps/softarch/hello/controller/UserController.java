package cat.udl.eps.softarch.hello.controller;

import cat.udl.eps.softarch.hello.service.PersonMeasuresService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import com.google.common.base.Preconditions;
import cat.udl.eps.softarch.hello.model.Person;
import cat.udl.eps.softarch.hello.repository.PersonRepository;
import cat.udl.eps.softarch.hello.service.PersonGreetingsService;
import java.security.Principal;

/**
 * Created by http://rhizomik.net/~roberto/
 */

@Controller
@RequestMapping(value = "/users")
public class UserController {
    final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    PersonRepository personRepository;
    @Autowired
    PersonGreetingsService personGreetingsService;
    @Autowired
    PersonMeasuresService personMeasuresService;

    // LIST
    @RequestMapping(method = RequestMethod.GET)
    @ResponseBody
    public Iterable<Person> list(@RequestParam(required = false, defaultValue = "0") int page,
            @RequestParam(required = false, defaultValue = "10") int size) {
        PageRequest request = new PageRequest(page, size);
        return personRepository.findAll(request).getContent();
    }

    @RequestMapping(method = RequestMethod.GET, produces = "text/html")
    public ModelAndView listHTML(@RequestParam(required = false, defaultValue = "0") int page,
            @RequestParam(required = false, defaultValue = "10") int size) {
        return new ModelAndView("users", "users", list(page, size));
    }

    // RETRIEVE
    @RequestMapping(value = "/{username}", method = RequestMethod.GET)
    @ResponseBody
    public Person retrieve(@PathVariable("username") String username) {
        logger.info("Retrieving user {}", username);
        Preconditions.checkNotNull(personRepository.findOne(username), "User with id %s not found", username);
        return personMeasuresService.getPersonAndMeasures(username);
    }

    @RequestMapping(value = "/{username}", method = RequestMethod.GET, produces = "text/html")
    public ModelAndView retrieveHTML(@PathVariable("username") String username, Principal principal, @RequestParam(required = false) boolean gainExp , @RequestParam(required = false) boolean completed ) {
        String name = principal.getName(); //get logged in username
        Person user = retrieve(username);
        int sizeTodaysMeasures = user.getTodaysMeasures().size();

        ModelAndView model = new ModelAndView("user", "user", user);
        model.addObject("username",name);
        model.addObject("sizeTodaysMeasures", sizeTodaysMeasures);
        if(completed) {
            if(gainExp) {
                model.addObject("gainExp", gainExp);
                model.addObject("completed", false);
            }else{
                model.addObject("completed", completed);
            }
        }


        return model;
    }
}
