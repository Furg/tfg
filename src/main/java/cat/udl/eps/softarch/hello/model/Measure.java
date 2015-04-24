package cat.udl.eps.softarch.hello.model;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.NumberFormat;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import java.util.Date;

/**
 * Created by Angel on 27/03/2015.
 */

@Entity
public class Measure {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotBlank
    private String username;

    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    private Date date;

    @NotNull(message = "Peso no puede estar vac\u00EDo.")
    @NumberFormat(style = NumberFormat.Style.NUMBER)
    private int weight;

    @NotBlank
    private String category;

    @NumberFormat(style = NumberFormat.Style.NUMBER)
    private int rations;

    @NumberFormat(style = NumberFormat.Style.NUMBER)
    private int rInsulin;

    @NumberFormat(style = NumberFormat.Style.NUMBER)
    private int sInsulin;

    private String comment;

    public Measure() {}

    public Measure(String username, Date date, int weight, String category) {
        this.username = username;
        this.date = date;
        this.weight = weight;
        this.category = category;
    }

    public long getId() { return id; }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getRations() {
        return rations;
    }

    public void setRations(int rations) {
        this.rations = rations;
    }

    public int getrInsulin() {
        return rInsulin;
    }

    public void setrInsulin(int rInsulin) {
        this.rInsulin = rInsulin;
    }

    public int getsInsulin() {
        return sInsulin;
    }

    public void setsInsulin(int sInsulin) {
        this.sInsulin = sInsulin;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
