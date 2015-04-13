package cat.udl.eps.softarch.hello.model;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Angel on 13/04/2015.
 */
@Entity
public class Test {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotBlank(message = "Name cannot be blank")
    private String name;

    private String description;

    @OneToMany(fetch = FetchType.EAGER, orphanRemoval = true)
    private List<QTest> questions = new ArrayList<>();

}
