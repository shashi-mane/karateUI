package UI_Automation_Project.login;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestLoginWithReusableRunner {

	@Test
	public Karate testRun() {
//		return Karate.run("login").relativeTo(getClass());
		return Karate.run("loginUsingReusable").relativeTo(getClass());
	}
}
