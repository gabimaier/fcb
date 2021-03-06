// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.fundatiacomunitarabucuresti.volunteer.domain;

import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Skill;
import ro.fundatiacomunitarabucuresti.volunteer.domain.SkillDataOnDemand;
import ro.fundatiacomunitarabucuresti.volunteer.domain.SkillIntegrationTest;

privileged aspect SkillIntegrationTest_Roo_IntegrationTest {
    
    declare @type: SkillIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: SkillIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: SkillIntegrationTest: @Transactional;
    
    @Autowired
    SkillDataOnDemand SkillIntegrationTest.dod;
    
    @Test
    public void SkillIntegrationTest.testCountSkills() {
        Assert.assertNotNull("Data on demand for 'Skill' failed to initialize correctly", dod.getRandomSkill());
        long count = Skill.countSkills();
        Assert.assertTrue("Counter for 'Skill' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void SkillIntegrationTest.testFindSkill() {
        Skill obj = dod.getRandomSkill();
        Assert.assertNotNull("Data on demand for 'Skill' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Skill' failed to provide an identifier", id);
        obj = Skill.findSkill(id);
        Assert.assertNotNull("Find method for 'Skill' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Skill' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void SkillIntegrationTest.testFindAllSkills() {
        Assert.assertNotNull("Data on demand for 'Skill' failed to initialize correctly", dod.getRandomSkill());
        long count = Skill.countSkills();
        Assert.assertTrue("Too expensive to perform a find all test for 'Skill', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Skill> result = Skill.findAllSkills();
        Assert.assertNotNull("Find all method for 'Skill' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Skill' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void SkillIntegrationTest.testFindSkillEntries() {
        Assert.assertNotNull("Data on demand for 'Skill' failed to initialize correctly", dod.getRandomSkill());
        long count = Skill.countSkills();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Skill> result = Skill.findSkillEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Skill' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Skill' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void SkillIntegrationTest.testFlush() {
        Skill obj = dod.getRandomSkill();
        Assert.assertNotNull("Data on demand for 'Skill' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Skill' failed to provide an identifier", id);
        obj = Skill.findSkill(id);
        Assert.assertNotNull("Find method for 'Skill' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifySkill(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Skill' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void SkillIntegrationTest.testMergeUpdate() {
        Skill obj = dod.getRandomSkill();
        Assert.assertNotNull("Data on demand for 'Skill' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Skill' failed to provide an identifier", id);
        obj = Skill.findSkill(id);
        boolean modified =  dod.modifySkill(obj);
        Integer currentVersion = obj.getVersion();
        Skill merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Skill' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void SkillIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Skill' failed to initialize correctly", dod.getRandomSkill());
        Skill obj = dod.getNewTransientSkill(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Skill' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Skill' identifier to be null", obj.getId());
        try {
            obj.persist();
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        obj.flush();
        Assert.assertNotNull("Expected 'Skill' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void SkillIntegrationTest.testRemove() {
        Skill obj = dod.getRandomSkill();
        Assert.assertNotNull("Data on demand for 'Skill' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Skill' failed to provide an identifier", id);
        obj = Skill.findSkill(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Skill' with identifier '" + id + "'", Skill.findSkill(id));
    }
    
}
