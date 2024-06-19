Feature: Login test
  This is login test
#json, retry, waitfor, reusable function, config file
Background:
* def locators = read('classpath:UI_Automation_Project/login/locators.json')
* def testData = read('classpath:UI_Automation_Project/login/testData.json')

# user login using login details in testData.json file 
Scenario: Login with valid login credentials using standard users
    Given driver baseUrl
    And input(locators.saucelabsLogin.Username, testData.Standard_login.Username)
    * delay(3000)
    And input(locators.saucelabsLogin.Password, testData.Standard_login.Password)
    * delay(3000)
    When click(locators.saucelabsLogin.Login_Button)
    * delay(3000)
    Then match driver.title == 'Swag Labs'
    And match driver.url == homepageUrl
    * delay(3000)

# user login using login details through csv file
Scenario Outline: Login using csv file
    Given driver baseUrl
    And input(locators.saucelabsLogin.Username, '<username>')
    * delay(3000)
    And input(locators.saucelabsLogin.Password, '<password>')
    * delay(3000)
    When click(locators.saucelabsLogin.Login_Button)
    * delay(3000)
    Then match driver.title == 'Swag Labs'
    And match driver.url == homepageUrl
    * delay(3000)
		
		Examples:
		|read('login_data.csv')|

  Scenario Outline: Login with valid login credentials
    * configure driver = {type: 'chrome'}
    Given driver 'https://www.saucedemo.com/'
    And input("//*[@id='user-name']",'<username>')
    * delay(3000)
    And input("//*[@id='password']",'<password>')
    * delay(3000)
    When click("//*[@id='login-button']")
    * delay(3000)
    Then match driver.title == 'Swag Labs'
    And match driver.url == 'https://www.saucedemo.com/inventory.html'
    * delay(3000)

    Examples: 
      | read("login_data.csv") |

  Scenario Outline: Login with invalid login credentials
    * configure driver = {type: 'chrome'}
    Given driver 'https://www.saucedemo.com/'
    And input("//*[@id='user-name']",'<invalid_username>')
    * delay(3000)
    And input("//*[@id='password']",'<invalid_password>')
    * delay(3000)
    When click("//*[@id='login-button']")
    * delay(3000)
    * def error_content = text("//*[@id='login_button_container']/div/form/div[3]")
    * match error_content == invalid_error
    * delay(3000)

    Examples: 
      | read("login_data.csv") |

  Scenario Outline: Login with empty login credentials
    * configure driver = {type: 'chrome'}
    Given driver 'https://www.saucedemo.com/'
    And input("//*[@id='user-name']",'<empty_username>')
    * delay(3000)
    And input("//*[@id='password']",'<empty_password>')
    * delay(3000)
    When click("//*[@id='login-button']")
    * delay(3000)
    * def error_content = text("//*[@id='login_button_container']/div/form/div[3]")
    * match error_content == empty_error
    * delay(3000)
    * delay(3000)* 
    * delay(3000)

    Examples: 
      | read("login_data.csv") |
      
      
      
      
