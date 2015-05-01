package cat.udl.eps.softarch.hello.controller;

import cat.udl.eps.softarch.hello.model.Greeting;
import cat.udl.eps.softarch.hello.model.Measure;
import cat.udl.eps.softarch.hello.model.QTest;
import cat.udl.eps.softarch.hello.model.Test;
import cat.udl.eps.softarch.hello.repository.MeasureRepository;
import cat.udl.eps.softarch.hello.repository.TestRepository;
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
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

/**
 * Created by Angel on 14/04/2015.
 */

@Controller
@RequestMapping(value = "/tests")
public class TestController {
    final Logger logger = LoggerFactory.getLogger(TestController.class);
    ArrayList<String> types = new ArrayList<String>() {{
        add("Diabetes");
        add("Dieta");
        add("Nutrici\u00F3n");
        add("Obesidad");
    }};

    @Autowired
    TestRepository testRepository;


    // LIST
    @RequestMapping(method = RequestMethod.GET)
    @ResponseBody
    public Iterable<Test> list(@RequestParam(required=false, defaultValue="0") int page,
                                   @RequestParam(required=false, defaultValue="10") int size) {
        PageRequest request = new PageRequest(page, size);
        return testRepository.findAll(request).getContent();
    }
    @RequestMapping(method = RequestMethod.GET, produces = "text/html")
    public ModelAndView listHTML(@RequestParam(required=false, defaultValue="0") int page,
                                 @RequestParam(required=false, defaultValue="10") int size) {
        return new ModelAndView("tests", "tests", list(page, size));
    }

    // CREATE
    @RequestMapping(value = "/form", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    @ResponseBody
    public void create(@Valid @RequestBody Test test) {
        logger.info("Creating test with name'{}'", test.getName());
        testRepository.save(test);
    }

    @RequestMapping(value = "/form", method = RequestMethod.POST, consumes = "application/x-www-form-urlencoded", produces="text/html;charset=UTF-8")
    public String createHTML(@Valid @ModelAttribute("test") Test test, BindingResult binding, HttpServletResponse response, Model model){
        if(binding.hasErrors()){
            logger.info("Validation error: {}", binding);
            model.addAttribute("types", types);
            return "testform";
        }
        if(!checkAnswers(test)){
            model.addAttribute("types", types);
            return "testform";
        }
        setTestNames(test);
        create(test);
        return "redirect:/tests";
    }

    // Create form
    @RequestMapping(value = "/form", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public ModelAndView createForm() {
        logger.info("Generating form for test creation");
        Test emptyTest = new Test();
        ModelAndView model = new ModelAndView("testform","test",emptyTest);
        model.addObject("types",types);
        return model;
    }

    public void setTestNames(Test test) {
        for(Iterator<QTest> i = test.getQuestions().iterator(); i.hasNext(); ) {
            QTest item = i.next();
            item.setTestname(test.getName());
        }
    }

    public boolean checkAnswers(Test test)
    {
        for(Iterator<QTest> i = test.getQuestions().iterator(); i.hasNext(); ) {
            QTest item = i.next();
            if(!item.getAnswer().equals("Verdadero") && !item.getAnswer().equals("Falso")){
                return false;
            }
        }
        return true;
    }

    // DO
    @RequestMapping(value = "/do/{id}", method = RequestMethod.POST, consumes = "application/x-www-form-urlencoded", produces="text/html;charset=UTF-8")
    public String createHTML(@ModelAttribute("test") Test test, @PathVariable("id") Long id, BindingResult binding, HttpServletResponse response, Model model){
        Test dbtest = retrieve(test.getId());
        int correct = getNumberCorrectAnswers(dbtest, test);
        int size = dbtest.getQuestions().size();

        if(size != correct){
            model.addAttribute("notCorrect",true);
            model.addAttribute("size",size);
            model.addAttribute("corrects",correct);
            return "testdoform";
        }

        //Marcar test como realizado en este usuario

        return "redirect:/tests";
    }

    public int getNumberCorrectAnswers(Test dbtest, Test test) {
        int correct = 0;
        for(int i=0; i < dbtest.getQuestions().size(); i++){
            if(dbtest.getQuestions().get(i).getAnswer().equals(test.getQuestions().get(i).getAnswer())){
                correct++;
            }
        }
        return correct;
    }

    // Create do form
    @RequestMapping(value = "/do/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Test retrieve(@PathVariable("id") Long id) {
        logger.info("Retrieving test number {}", id);
        Preconditions.checkArgument(testRepository.exists(id),"El test con id %s no existe.", id);
        return testRepository.findOne(id);
    }

    @RequestMapping(value = "/do/{id}", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public ModelAndView createDoForm(@PathVariable("id") Long id) {
        logger.info("Generating form for do test");
        Test test = retrieve(id);
        setAllVerdader(test);
        return new ModelAndView("testdoform","test",test);
    }

    public void setAllVerdader(Test test) {
        for(Iterator<QTest> i = test.getQuestions().iterator(); i.hasNext(); ) {
            QTest item = i.next();
            item.setAnswer("Verdader");
        }
    }


}
