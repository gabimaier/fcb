package ro.fundatiacomunitarabucuresti.volunteer.web;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ro.fundatiacomunitarabucuresti.volunteer.domain.City;

@RequestMapping("/citys")
@Controller
@RooWebScaffold(path = "citys", formBackingObject = City.class)
public class CityController {
}
