// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.fundatiacomunitarabucuresti.volunteer.web;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;
import ro.fundatiacomunitarabucuresti.volunteer.domain.City;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Organization;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Project;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Skill;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Tag;
import ro.fundatiacomunitarabucuresti.volunteer.domain.UserAccount;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Volunteer;
import ro.fundatiacomunitarabucuresti.volunteer.domain.VolunteerApplication;
import ro.fundatiacomunitarabucuresti.volunteer.web.ApplicationConversionServiceFactoryBean;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    public Converter<City, String> ApplicationConversionServiceFactoryBean.getCityToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<ro.fundatiacomunitarabucuresti.volunteer.domain.City, java.lang.String>() {
            public String convert(City city) {
                return new StringBuilder().append(city.getName()).toString();
            }
        };
    }
    
    public Converter<Long, City> ApplicationConversionServiceFactoryBean.getIdToCityConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, ro.fundatiacomunitarabucuresti.volunteer.domain.City>() {
            public ro.fundatiacomunitarabucuresti.volunteer.domain.City convert(java.lang.Long id) {
                return City.findCity(id);
            }
        };
    }
    
    public Converter<String, City> ApplicationConversionServiceFactoryBean.getStringToCityConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, ro.fundatiacomunitarabucuresti.volunteer.domain.City>() {
            public ro.fundatiacomunitarabucuresti.volunteer.domain.City convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), City.class);
            }
        };
    }
    
    public Converter<Organization, String> ApplicationConversionServiceFactoryBean.getOrganizationToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<ro.fundatiacomunitarabucuresti.volunteer.domain.Organization, java.lang.String>() {
            public String convert(Organization organization) {
                return new StringBuilder().append(organization.getName()).append(' ').append(organization.getWebsite()).toString();
            }
        };
    }
    
    public Converter<Long, Organization> ApplicationConversionServiceFactoryBean.getIdToOrganizationConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, ro.fundatiacomunitarabucuresti.volunteer.domain.Organization>() {
            public ro.fundatiacomunitarabucuresti.volunteer.domain.Organization convert(java.lang.Long id) {
                return Organization.findOrganization(id);
            }
        };
    }
    
    public Converter<String, Organization> ApplicationConversionServiceFactoryBean.getStringToOrganizationConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, ro.fundatiacomunitarabucuresti.volunteer.domain.Organization>() {
            public ro.fundatiacomunitarabucuresti.volunteer.domain.Organization convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Organization.class);
            }
        };
    }
    
    public Converter<Project, String> ApplicationConversionServiceFactoryBean.getProjectToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<ro.fundatiacomunitarabucuresti.volunteer.domain.Project, java.lang.String>() {
            public String convert(Project project) {
                return new StringBuilder().append(project.getTitle()).append(' ').append(project.getDescription()).append(' ').append(project.getStartDate()).append(' ').append(project.getInitialFeedback()).toString();
            }
        };
    }
    
    public Converter<Long, Project> ApplicationConversionServiceFactoryBean.getIdToProjectConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, ro.fundatiacomunitarabucuresti.volunteer.domain.Project>() {
            public ro.fundatiacomunitarabucuresti.volunteer.domain.Project convert(java.lang.Long id) {
                return Project.findProject(id);
            }
        };
    }
    
    public Converter<String, Project> ApplicationConversionServiceFactoryBean.getStringToProjectConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, ro.fundatiacomunitarabucuresti.volunteer.domain.Project>() {
            public ro.fundatiacomunitarabucuresti.volunteer.domain.Project convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Project.class);
            }
        };
    }
    
    public Converter<Skill, String> ApplicationConversionServiceFactoryBean.getSkillToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<ro.fundatiacomunitarabucuresti.volunteer.domain.Skill, java.lang.String>() {
            public String convert(Skill skill) {
                return new StringBuilder().append(skill.getName()).toString();
            }
        };
    }
    
    public Converter<Long, Skill> ApplicationConversionServiceFactoryBean.getIdToSkillConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, ro.fundatiacomunitarabucuresti.volunteer.domain.Skill>() {
            public ro.fundatiacomunitarabucuresti.volunteer.domain.Skill convert(java.lang.Long id) {
                return Skill.findSkill(id);
            }
        };
    }
    
    public Converter<String, Skill> ApplicationConversionServiceFactoryBean.getStringToSkillConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, ro.fundatiacomunitarabucuresti.volunteer.domain.Skill>() {
            public ro.fundatiacomunitarabucuresti.volunteer.domain.Skill convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Skill.class);
            }
        };
    }
    
    public Converter<Tag, String> ApplicationConversionServiceFactoryBean.getTagToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<ro.fundatiacomunitarabucuresti.volunteer.domain.Tag, java.lang.String>() {
            public String convert(Tag tag) {
                return new StringBuilder().append(tag.getName()).toString();
            }
        };
    }
    
    public Converter<Long, Tag> ApplicationConversionServiceFactoryBean.getIdToTagConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, ro.fundatiacomunitarabucuresti.volunteer.domain.Tag>() {
            public ro.fundatiacomunitarabucuresti.volunteer.domain.Tag convert(java.lang.Long id) {
                return Tag.findTag(id);
            }
        };
    }
    
    public Converter<String, Tag> ApplicationConversionServiceFactoryBean.getStringToTagConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, ro.fundatiacomunitarabucuresti.volunteer.domain.Tag>() {
            public ro.fundatiacomunitarabucuresti.volunteer.domain.Tag convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Tag.class);
            }
        };
    }
    
    public Converter<UserAccount, String> ApplicationConversionServiceFactoryBean.getUserAccountToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<ro.fundatiacomunitarabucuresti.volunteer.domain.UserAccount, java.lang.String>() {
            public String convert(UserAccount userAccount) {
                return new StringBuilder().append(userAccount.getUserName()).append(' ').append(userAccount.getPassword()).append(' ').append(userAccount.getFirstName()).append(' ').append(userAccount.getLastName()).toString();
            }
        };
    }
    
    public Converter<Long, UserAccount> ApplicationConversionServiceFactoryBean.getIdToUserAccountConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, ro.fundatiacomunitarabucuresti.volunteer.domain.UserAccount>() {
            public ro.fundatiacomunitarabucuresti.volunteer.domain.UserAccount convert(java.lang.Long id) {
                return UserAccount.findUserAccount(id);
            }
        };
    }
    
    public Converter<String, UserAccount> ApplicationConversionServiceFactoryBean.getStringToUserAccountConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, ro.fundatiacomunitarabucuresti.volunteer.domain.UserAccount>() {
            public ro.fundatiacomunitarabucuresti.volunteer.domain.UserAccount convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), UserAccount.class);
            }
        };
    }
    
    public Converter<Volunteer, String> ApplicationConversionServiceFactoryBean.getVolunteerToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<ro.fundatiacomunitarabucuresti.volunteer.domain.Volunteer, java.lang.String>() {
            public String convert(Volunteer volunteer) {
                return "(no displayable fields)";
            }
        };
    }
    
    public Converter<Long, Volunteer> ApplicationConversionServiceFactoryBean.getIdToVolunteerConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, ro.fundatiacomunitarabucuresti.volunteer.domain.Volunteer>() {
            public ro.fundatiacomunitarabucuresti.volunteer.domain.Volunteer convert(java.lang.Long id) {
                return Volunteer.findVolunteer(id);
            }
        };
    }
    
    public Converter<String, Volunteer> ApplicationConversionServiceFactoryBean.getStringToVolunteerConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, ro.fundatiacomunitarabucuresti.volunteer.domain.Volunteer>() {
            public ro.fundatiacomunitarabucuresti.volunteer.domain.Volunteer convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Volunteer.class);
            }
        };
    }
    
    public Converter<VolunteerApplication, String> ApplicationConversionServiceFactoryBean.getVolunteerApplicationToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<ro.fundatiacomunitarabucuresti.volunteer.domain.VolunteerApplication, java.lang.String>() {
            public String convert(VolunteerApplication volunteerApplication) {
                return "(no displayable fields)";
            }
        };
    }
    
    public Converter<Long, VolunteerApplication> ApplicationConversionServiceFactoryBean.getIdToVolunteerApplicationConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, ro.fundatiacomunitarabucuresti.volunteer.domain.VolunteerApplication>() {
            public ro.fundatiacomunitarabucuresti.volunteer.domain.VolunteerApplication convert(java.lang.Long id) {
                return VolunteerApplication.findVolunteerApplication(id);
            }
        };
    }
    
    public Converter<String, VolunteerApplication> ApplicationConversionServiceFactoryBean.getStringToVolunteerApplicationConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, ro.fundatiacomunitarabucuresti.volunteer.domain.VolunteerApplication>() {
            public ro.fundatiacomunitarabucuresti.volunteer.domain.VolunteerApplication convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), VolunteerApplication.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getCityToStringConverter());
        registry.addConverter(getIdToCityConverter());
        registry.addConverter(getStringToCityConverter());
        registry.addConverter(getOrganizationToStringConverter());
        registry.addConverter(getIdToOrganizationConverter());
        registry.addConverter(getStringToOrganizationConverter());
        registry.addConverter(getProjectToStringConverter());
        registry.addConverter(getIdToProjectConverter());
        registry.addConverter(getStringToProjectConverter());
        registry.addConverter(getSkillToStringConverter());
        registry.addConverter(getIdToSkillConverter());
        registry.addConverter(getStringToSkillConverter());
        registry.addConverter(getTagToStringConverter());
        registry.addConverter(getIdToTagConverter());
        registry.addConverter(getStringToTagConverter());
        registry.addConverter(getUserAccountToStringConverter());
        registry.addConverter(getIdToUserAccountConverter());
        registry.addConverter(getStringToUserAccountConverter());
        registry.addConverter(getVolunteerToStringConverter());
        registry.addConverter(getIdToVolunteerConverter());
        registry.addConverter(getStringToVolunteerConverter());
        registry.addConverter(getVolunteerApplicationToStringConverter());
        registry.addConverter(getIdToVolunteerApplicationConverter());
        registry.addConverter(getStringToVolunteerApplicationConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}
