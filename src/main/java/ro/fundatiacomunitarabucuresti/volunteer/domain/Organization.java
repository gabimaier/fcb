package ro.fundatiacomunitarabucuresti.volunteer.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(table = "organizations")
public class Organization {

    /**
     */
    @NotNull
    @Column(unique = true)
    @Size(min = 1, max = 250)
    private String name;

    /**
     */
    @ManyToOne
    private UserAccount userAccount;

    /**
     */
    private String website;
}
