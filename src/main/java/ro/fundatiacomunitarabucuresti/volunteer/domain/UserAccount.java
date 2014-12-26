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
@RooJpaActiveRecord(table = "user_accounts")
public class UserAccount {

    /**
     */
    @NotNull
    @Column(unique = true)
    @Size(min = 1, max = 50)
    private String userName;

    /**
     */
    @NotNull
    @Size(min = 1, max = 50)
    private String password;

    /**
     */
    @NotNull
    @Size(min = 1, max = 50)
    private String firstName;

    /**
     */
    @NotNull
    @Size(min = 1, max = 50)
    private String lastName;

    /**
     */
    @NotNull
    @Column(unique = true)
    @Size(min = 3, max = 20)
    private String phone;

    /**
     */
    @NotNull
    @Size(min = 5, max = 100)
    private String email;

    /**
     */
    @NotNull
    private Boolean enabled;

    /**
     */
    @NotNull
    @ManyToOne
    private City city;
}
