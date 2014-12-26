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
import ro.fundatiacomunitarabucuresti.volunteer.domain.VolunteerApplication;
import ro.fundatiacomunitarabucuresti.volunteer.domain.VolunteerApplicationDataOnDemand;
import ro.fundatiacomunitarabucuresti.volunteer.domain.VolunteerApplicationIntegrationTest;

privileged aspect VolunteerApplicationIntegrationTest_Roo_IntegrationTest {
    
    declare @type: VolunteerApplicationIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: VolunteerApplicationIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: VolunteerApplicationIntegrationTest: @Transactional;
    
    @Autowired
    VolunteerApplicationDataOnDemand VolunteerApplicationIntegrationTest.dod;
    
    @Test
    public void VolunteerApplicationIntegrationTest.testCountVolunteerApplications() {
        Assert.assertNotNull("Data on demand for 'VolunteerApplication' failed to initialize correctly", dod.getRandomVolunteerApplication());
        long count = VolunteerApplication.countVolunteerApplications();
        Assert.assertTrue("Counter for 'VolunteerApplication' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void VolunteerApplicationIntegrationTest.testFindVolunteerApplication() {
        VolunteerApplication obj = dod.getRandomVolunteerApplication();
        Assert.assertNotNull("Data on demand for 'VolunteerApplication' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'VolunteerApplication' failed to provide an identifier", id);
        obj = VolunteerApplication.findVolunteerApplication(id);
        Assert.assertNotNull("Find method for 'VolunteerApplication' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'VolunteerApplication' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void VolunteerApplicationIntegrationTest.testFindAllVolunteerApplications() {
        Assert.assertNotNull("Data on demand for 'VolunteerApplication' failed to initialize correctly", dod.getRandomVolunteerApplication());
        long count = VolunteerApplication.countVolunteerApplications();
        Assert.assertTrue("Too expensive to perform a find all test for 'VolunteerApplication', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<VolunteerApplication> result = VolunteerApplication.findAllVolunteerApplications();
        Assert.assertNotNull("Find all method for 'VolunteerApplication' illegally returned null", result);
        Assert.assertTrue("Find all method for 'VolunteerApplication' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void VolunteerApplicationIntegrationTest.testFindVolunteerApplicationEntries() {
        Assert.assertNotNull("Data on demand for 'VolunteerApplication' failed to initialize correctly", dod.getRandomVolunteerApplication());
        long count = VolunteerApplication.countVolunteerApplications();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<VolunteerApplication> result = VolunteerApplication.findVolunteerApplicationEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'VolunteerApplication' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'VolunteerApplication' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void VolunteerApplicationIntegrationTest.testFlush() {
        VolunteerApplication obj = dod.getRandomVolunteerApplication();
        Assert.assertNotNull("Data on demand for 'VolunteerApplication' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'VolunteerApplication' failed to provide an identifier", id);
        obj = VolunteerApplication.findVolunteerApplication(id);
        Assert.assertNotNull("Find method for 'VolunteerApplication' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyVolunteerApplication(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'VolunteerApplication' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void VolunteerApplicationIntegrationTest.testMergeUpdate() {
        VolunteerApplication obj = dod.getRandomVolunteerApplication();
        Assert.assertNotNull("Data on demand for 'VolunteerApplication' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'VolunteerApplication' failed to provide an identifier", id);
        obj = VolunteerApplication.findVolunteerApplication(id);
        boolean modified =  dod.modifyVolunteerApplication(obj);
        Integer currentVersion = obj.getVersion();
        VolunteerApplication merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'VolunteerApplication' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void VolunteerApplicationIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'VolunteerApplication' failed to initialize correctly", dod.getRandomVolunteerApplication());
        VolunteerApplication obj = dod.getNewTransientVolunteerApplication(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'VolunteerApplication' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'VolunteerApplication' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'VolunteerApplication' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void VolunteerApplicationIntegrationTest.testRemove() {
        VolunteerApplication obj = dod.getRandomVolunteerApplication();
        Assert.assertNotNull("Data on demand for 'VolunteerApplication' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'VolunteerApplication' failed to provide an identifier", id);
        obj = VolunteerApplication.findVolunteerApplication(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'VolunteerApplication' with identifier '" + id + "'", VolunteerApplication.findVolunteerApplication(id));
    }
    
}