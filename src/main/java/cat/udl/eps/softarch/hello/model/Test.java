package cat.udl.eps.softarch.hello.model;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Angel on 13/04/2015.
 */
@Entity
public class Test implements Cloneable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotBlank(message = "Nombre no puede estar vac\u00EDo.")
    private String name;

    @NotBlank(message = "Tema no puede estar vac\u00EDo.")
    private String type;

    private String description;

    @OneToMany(cascade=CascadeType.ALL, fetch = FetchType.EAGER, orphanRemoval = true)
    private List<QTest> questions = new ArrayList<>();

    public Test() {}

    public Test(String name, String type, String description) {
        this.name = name;
        this.type = type;
        this.description = description;
    }

    public long getId() {
        return id;
    }

    public void setId(Long id){ this.id = id; }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<QTest> getQuestions() {
        return questions;
    }

    public void addQuestion(QTest newQuestion) {
        questions.add(newQuestion);
    }

    public void removeQuestion(QTest question) {
        questions.remove(question);
    }

    public boolean hasDescription() {
        return !this.description.equals("");
    }

}
