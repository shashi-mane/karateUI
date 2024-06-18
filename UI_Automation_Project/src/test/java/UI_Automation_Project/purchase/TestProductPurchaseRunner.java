package UI_Automation_Project.purchase;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestProductPurchaseRunner {

	@Test
	public Karate testRun() {
		return Karate.run("productPurchase").relativeTo(getClass());
	}
}
