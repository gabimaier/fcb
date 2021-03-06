// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.fundatiacomunitarabucuresti.volunteer.web;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Project;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Volunteer;
import ro.fundatiacomunitarabucuresti.volunteer.domain.VolunteerApplication;
import ro.fundatiacomunitarabucuresti.volunteer.web.VolunteerApplicationController;

privileged aspect VolunteerApplicationController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String VolunteerApplicationController.create(@Valid VolunteerApplication volunteerApplication, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, volunteerApplication);
            return "volunteerapplications/create";
        }
        uiModel.asMap().clear();
        volunteerApplication.persist();
        return "redirect:/volunteerapplications/" + encodeUrlPathSegment(volunteerApplication.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String VolunteerApplicationController.createForm(Model uiModel) {
        populateEditForm(uiModel, new VolunteerApplication());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (Volunteer.countVolunteers() == 0) {
            dependencies.add(new String[] { "volunteer", "volunteers" });
        }
        if (Project.countProjects() == 0) {
            dependencies.add(new String[] { "project", "projects" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "volunteerapplications/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String VolunteerApplicationController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("volunteerapplication", VolunteerApplication.findVolunteerApplication(id));
        uiModel.addAttribute("itemId", id);
        return "volunteerapplications/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String VolunteerApplicationController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("volunteerapplications", VolunteerApplication.findVolunteerApplicationEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) VolunteerApplication.countVolunteerApplications() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("volunteerapplications", VolunteerApplication.findAllVolunteerApplications(sortFieldName, sortOrder));
        }
        return "volunteerapplications/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String VolunteerApplicationController.update(@Valid VolunteerApplication volunteerApplication, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, volunteerApplication);
            return "volunteerapplications/update";
        }
        uiModel.asMap().clear();
        volunteerApplication.merge();
        return "redirect:/volunteerapplications/" + encodeUrlPathSegment(volunteerApplication.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String VolunteerApplicationController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, VolunteerApplication.findVolunteerApplication(id));
        return "volunteerapplications/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String VolunteerApplicationController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        VolunteerApplication volunteerApplication = VolunteerApplication.findVolunteerApplication(id);
        volunteerApplication.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/volunteerapplications";
    }
    
    void VolunteerApplicationController.populateEditForm(Model uiModel, VolunteerApplication volunteerApplication) {
        uiModel.addAttribute("volunteerApplication", volunteerApplication);
        uiModel.addAttribute("projects", Project.findAllProjects());
        uiModel.addAttribute("volunteers", Volunteer.findAllVolunteers());
    }
    
    String VolunteerApplicationController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
