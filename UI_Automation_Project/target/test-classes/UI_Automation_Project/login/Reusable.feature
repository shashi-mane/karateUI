@ignore
Feature: reusable function

  Background: 
    * def locators = read('classpath:UI_Automation_Project/login/locators.json')
    * def testData = read('classpath:UI_Automation_Project/login/testData.json')

  @LogInSauceLabs
  Scenario: log in saucelabs
    * maximize()
    When retry(3).waitForUrl(baseUrl)
    * input(locators.saucelabsLogin.Username, Login.Username)
    * input(locators.saucelabsLogin.Password, Login.Password)
    #* delay(2000)
    * click(locators.saucelabsLogin.Login_Button)
