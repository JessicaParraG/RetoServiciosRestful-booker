package restful.booker.herokuapp.Booking;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class BookingRunner {

    @Karate.Test
    Karate testSample() {
        return Karate.run("GetBooking.feature").relativeTo(getClass());
    }

    @Karate.Test
    Karate testTags() {
        return Karate.run("GetBooking.feature").tags("@Get").relativeTo(getClass());
    }

    @Karate.Test
    Karate testSystemProperty() {
        return Karate.run("classpath:karate/tags.feature")
                .tags("@second")
                .karateEnv("e2e")
                .systemProperty("foo", "bar");
    }

    //Ejecución paralela
    @Karate.Test
    void testParallel() {
        Results results = Runner.path("classpath:animals").tags("~@skipme").parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}
