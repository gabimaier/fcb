// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.fundatiacomunitarabucuresti.volunteer.domain;

import java.util.Date;
import java.util.List;
import java.util.Set;
import ro.fundatiacomunitarabucuresti.volunteer.domain.City;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Organization;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Project;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Skill;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Tag;
import ro.fundatiacomunitarabucuresti.volunteer.domain.VolunteerApplication;

privileged aspect Project_Roo_JavaBean {
    
    public Organization Project.getOrganization() {
        return this.organization;
    }
    
    public void Project.setOrganization(Organization organization) {
        this.organization = organization;
    }
    
    public String Project.getTitle() {
        return this.title;
    }
    
    public void Project.setTitle(String title) {
        this.title = title;
    }
    
    public String Project.getDescription() {
        return this.description;
    }
    
    public void Project.setDescription(String description) {
        this.description = description;
    }
    
    public Set<Tag> Project.getTags() {
        return this.tags;
    }
    
    public void Project.setTags(Set<Tag> tags) {
        this.tags = tags;
    }
    
    public List<Skill> Project.getRequiredSkills() {
        return this.requiredSkills;
    }
    
    public void Project.setRequiredSkills(List<Skill> requiredSkills) {
        this.requiredSkills = requiredSkills;
    }
    
    public Date Project.getStartDate() {
        return this.startDate;
    }
    
    public void Project.setStartDate(Date startDate) {
        this.startDate = startDate;
    }
    
    public Boolean Project.getAccepted() {
        return this.accepted;
    }
    
    public void Project.setAccepted(Boolean accepted) {
        this.accepted = accepted;
    }
    
    public String Project.getInitialFeedback() {
        return this.initialFeedback;
    }
    
    public void Project.setInitialFeedback(String initialFeedback) {
        this.initialFeedback = initialFeedback;
    }
    
    public String Project.getResults() {
        return this.results;
    }
    
    public void Project.setResults(String results) {
        this.results = results;
    }
    
    public String Project.getProgress() {
        return this.progress;
    }
    
    public void Project.setProgress(String progress) {
        this.progress = progress;
    }
    
    public City Project.getCity() {
        return this.city;
    }
    
    public void Project.setCity(City city) {
        this.city = city;
    }
    
    public Set<VolunteerApplication> Project.getVolunteers() {
        return this.volunteers;
    }
    
    public void Project.setVolunteers(Set<VolunteerApplication> volunteers) {
        this.volunteers = volunteers;
    }
    
}