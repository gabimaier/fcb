// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.fundatiacomunitarabucuresti.volunteer.web;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;
import ro.fundatiacomunitarabucuresti.volunteer.domain.City;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Organization;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Project;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Skill;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Tag;
import ro.fundatiacomunitarabucuresti.volunteer.domain.VolunteerApplication;
import ro.fundatiacomunitarabucuresti.volunteer.web.ProjectController;

privileged aspect ProjectController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ProjectController.create(@Valid Project project, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, project);
            return "projects/create";
        }
        uiModel.asMap().clear();
        project.persist();
        return "redirect:/projects/" + encodeUrlPathSegment(project.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ProjectController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Project());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (Organization.countOrganizations() == 0) {
            dependencies.add(new String[] { "organization", "organizations" });
        }
        if (City.countCitys() == 0) {
            dependencies.add(new String[] { "city", "citys" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "projects/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ProjectController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("project", Project.findProject(id));
        uiModel.addAttribute("itemId", id);
        return "projects/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ProjectController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("projects", Project.findProjectEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Project.countProjects() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("projects", Project.findAllProjects(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "projects/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ProjectController.update(@Valid Project project, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, project);
            return "projects/update";
        }
        uiModel.asMap().clear();
        project.merge();
        return "redirect:/projects/" + encodeUrlPathSegment(project.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ProjectController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Project.findProject(id));
        return "projects/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ProjectController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Project project = Project.findProject(id);
        project.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/projects";
    }
    
    void ProjectController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("project_startdate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void ProjectController.populateEditForm(Model uiModel, Project project) {
        uiModel.addAttribute("project", project);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("citys", City.findAllCitys());
        uiModel.addAttribute("organizations", Organization.findAllOrganizations());
        uiModel.addAttribute("skills", Skill.findAllSkills());
        uiModel.addAttribute("tags", Tag.findAllTags());
        uiModel.addAttribute("volunteerapplications", VolunteerApplication.findAllVolunteerApplications());
    }
    
    String ProjectController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
