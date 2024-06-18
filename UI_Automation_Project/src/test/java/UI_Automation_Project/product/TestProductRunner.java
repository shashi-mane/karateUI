package UI_Automation_Project.product;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestProductRunner {

	@Test
	public Karate testRun() {
		return Karate.run("addRemoveProduct").relativeTo(getClass());
	}
}
