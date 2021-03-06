// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.fundatiacomunitarabucuresti.volunteer.domain;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import ro.fundatiacomunitarabucuresti.volunteer.domain.City;

privileged aspect City_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager City.entityManager;
    
    public static final List<String> City.fieldNames4OrderClauseFilter = java.util.Arrays.asList("name");
    
    public static final EntityManager City.entityManager() {
        EntityManager em = new City().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long City.countCitys() {
        return entityManager().createQuery("SELECT COUNT(o) FROM City o", Long.class).getSingleResult();
    }
    
    public static List<City> City.findAllCitys() {
        return entityManager().createQuery("SELECT o FROM City o", City.class).getResultList();
    }
    
    public static List<City> City.findAllCitys(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM City o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, City.class).getResultList();
    }
    
    public static City City.findCity(Long id) {
        if (id == null) return null;
        return entityManager().find(City.class, id);
    }
    
    public static List<City> City.findCityEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM City o", City.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<City> City.findCityEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM City o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, City.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void City.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void City.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            City attached = City.findCity(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void City.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void City.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public City City.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        City merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
