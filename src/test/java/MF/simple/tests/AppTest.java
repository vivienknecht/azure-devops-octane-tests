package MF.simple.tests;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

/**
 * Unit test for simple App.
 */
public class AppTest extends TestCase {
    /**
     * Create the test case
     *
     * @param testName name of the test case
     */
    public AppTest(String testName) {
        super(testName);
    }

    /**
     * @return the suite of tests being tested
     */
    public static Test suite() {
        return new TestSuite(AppTest.class);
    }

    /**
     * Rigourous Test :-)
     */
    public void testAppA() {
        System.out.print("AppTest.testAppA");
        assertTrue(true);
    }

    public void testAppB() {
        System.out.print("AppTest.testAppB");
        assertTrue(true);
    }

    public void testAppC() {
        assertTrue(true);
    }

    public void testWillFailOnParameter() {
        String value = System.getProperty("fail");
        if (value != null && value.toLowerCase().equals("true")) {
            fail("fail parameter is set");
        }
    }

    public void testWillThrowOnParameter() {
        String value = System.getProperty("throw");
        if (value != null && value.toLowerCase().equals("true")) {
            throw new RuntimeException("Throw parameter is set");
        }
    }

    public void testWillSleepOnParameter() throws InterruptedException {
        String value = System.getProperty("sleep");
        if (value != null) {
            long sleepMs = Long.parseLong(value);
            Thread.sleep(sleepMs);
        }
    }
}
