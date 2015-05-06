package cat.udl.eps.softarch.hello.model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import javax.persistence.*;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.URL;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.social.security.SocialUserDetails;

/**
 * Created by http://rhizomik.net/~roberto/
 */
@Entity
public class Person implements UserDetails{
    @Id
    @NotBlank(message = "Username cannot be blank")
    private String username;

    @Email(message = "E-mail should be valid")
    private String email;

    @OneToMany(fetch = FetchType.LAZY, orphanRemoval = true)
    private List<Greeting> greetings = new ArrayList<>();

    @OneToMany(fetch = FetchType.LAZY, orphanRemoval = true)
    private List<Measure> measures = new ArrayList<>();

    @ElementCollection(fetch=FetchType.EAGER)
    private List<Long> completeTests = new ArrayList<Long>();

    @NotNull()
    @NumberFormat(style = NumberFormat.Style.NUMBER)
    private int experience = 0;

    @URL
    private String imageUrl;

    @NotBlank(message = "Role cannot be blank")
    private String role = "USER";

    public Person() {
    }

    public Person(String username, String email) {
        this.username = username;
        this.email = email;
    }

    @Override
    public String getUsername() { return username; }

    public String getEmail() { return email; }

    public void setEmail(String email) { this.email = email; }

    public String getImageUrl() { return imageUrl; }

    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }

    public String getRole() {
        return role;
    }

    public List<Measure> getMeasures() {
        return measures;

    }

    public void addMeasure(Measure newMeasure) {
        measures.add(newMeasure);
    }

    public void removeMeasure(Measure measure) {
        measures.remove(measure);
    }

    public List<Greeting> getGreetings() {
        return greetings;

    }

    public void addGreeting(Greeting newGreeting) {
        greetings.add(newGreeting);
    }

    public void removeGreeting(Greeting greeting) {
        greetings.remove(greeting);
    }

    public List<Long> getCompleteTests() {
        return completeTests;
    }

    public void addCompleteTest(Long newCompleteTest) {
        completeTests.add(newCompleteTest);
    }

    public void removeCompleteTest(Long completeTest) {
        completeTests.remove(completeTest);
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        //return AuthorityUtils.commaSeparatedStringToAuthorityList(this.getRole());
        return AuthorityUtils.createAuthorityList(this.role);
    }

    @Override
    public String getPassword() { return null; }

    @Override
    public boolean isAccountNonExpired() { return true; }

    @Override
    public boolean isAccountNonLocked() { return true; }

    @Override
    public boolean isCredentialsNonExpired() { return true; }

    @Override
    public boolean isEnabled() { return true; }
}
