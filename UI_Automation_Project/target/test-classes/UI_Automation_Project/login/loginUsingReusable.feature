Feature: Add products in cart
  login with reusable and add products to cart

  Background: 
    * def locators = read('classpath:UI_Automation_Project/login/locators.json')
    * def testData = read('classpath:UI_Automation_Project/login/testData.json')

  Scenario: Add products to cart
    * configure driver = { type: 'chrome', addOptions: ['--incognito']}
    Given driver baseUrl
    * delay(2000)
    * karate.call('Reusable.feature@LogInSauceLabs', {Login:testData.Standard_login})
    * delay(3000)
    * scroll(locators.saucelabs.Sauce_Labs_Fleece_Jacket)
    * delay(2000)
    # click on product name
    * click(locators.saucelabs.Sauce_Labs_Fleece_Jacket)
    * delay(3000)
    # add product to cart from product page
    * click(locators.saucelabs.add_to_cart)
    * delay(3000)
    # check if item is added or not
    * def cart_items1 = text(locators.saucelabs.cart_items_count)
    * match cart_items1 == '1'
    * delay(3000)
