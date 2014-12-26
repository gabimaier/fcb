package ro.fundatiacomunitarabucuresti.volunteer.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(table = "volunteers")
public class Volunteer {

    /**
     */
    @NotNull
    @ManyToOne
    private UserAccount userAccount;

    /**
     */
    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Skill> skills = new HashSet<Skill>();

    /**
     */
    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Skill> expertSkills = new HashSet<Skill>();
}
