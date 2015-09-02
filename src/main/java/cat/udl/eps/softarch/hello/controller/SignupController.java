package cat.udl.eps.softarch.hello.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.web.ProviderSignInUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.WebRequest;
import cat.udl.eps.softarch.hello.model.Person;
import cat.udl.eps.softarch.hello.repository.PersonRepository;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by http://rhizomik.net/~roberto/
 */
@Controller
public class SignupController {

    @Autowired
    PersonRepository personRepository;

    private final ProviderSignInUtils providerSignInUtils = new ProviderSignInUtils();

    @RequestMapping(value="/login")
    public String login() { return "startTemplate"; }

    @RequestMapping(value="/signup", method=RequestMethod.GET)
    public String signup(WebRequest request) {
        Connection<?> connection = providerSignInUtils.getConnectionFromSession(request);
        if (connection != null) {
            Person user;
            if(!personRepository.exists(connection.getDisplayName()))
            {
                user = new Person(connection.getDisplayName(), "");
                user.setImageUrl(replaceLast(connection.getImageUrl(),"normal","400x400"));
                personRepository.save(user);
            }
            else
            {
                user = personRepository.findOne(connection.getDisplayName());
            }

            Authentication authentication = new UsernamePasswordAuthenticationToken(user.getUsername(),
                                                                                    null,
                                                                                    user.getAuthorities());
            SecurityContextHolder.getContext().setAuthentication(authentication);
            return "redirect:/users/"+connection.getDisplayName();
        }
        return null;
    }

    public static String replaceLast(String text, String regex, String replacement) {
        return text.replaceFirst("(?s)(.*)" + regex, "$1" + replacement);
    }
}
