// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.fundatiacomunitarabucuresti.volunteer.domain;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Volunteer;

privileged aspect Volunteer_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Volunteer.entityManager;
    
    public static final List<String> Volunteer.fieldNames4OrderClauseFilter = java.util.Arrays.asList("userAccount", "skills", "expertSkills");
    
    public static final EntityManager Volunteer.entityManager() {
        EntityManager em = new Volunteer().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Volunteer.countVolunteers() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Volunteer o", Long.class).getSingleResult();
    }
    
    public static List<Volunteer> Volunteer.findAllVolunteers() {
        return entityManager().createQuery("SELECT o FROM Volunteer o", Volunteer.class).getResultList();
    }
    
    public static List<Volunteer> Volunteer.findAllVolunteers(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Volunteer o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Volunteer.class).getResultList();
    }
    
    public static Volunteer Volunteer.findVolunteer(Long id) {
        if (id == null) return null;
        return entityManager().find(Volunteer.class, id);
    }
    
    public static List<Volunteer> Volunteer.findVolunteerEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Volunteer o", Volunteer.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Volunteer> Volunteer.findVolunteerEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Volunteer o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Volunteer.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Volunteer.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Volunteer.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Volunteer attached = Volunteer.findVolunteer(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Volunteer.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Volunteer.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Volunteer Volunteer.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Volunteer merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
