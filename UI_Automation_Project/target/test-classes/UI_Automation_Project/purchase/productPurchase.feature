Feature: Add single product to cart

  Background: logged in successfully
    Given call read("../user_login.feature")

  Scenario: Add single product to cart
    # add multiple item to cart
    * click("//*[@id='add-to-cart-sauce-labs-backpack']")
    * delay(2000)
    * scroll("//*[@id='item_0_title_link']")
    * delay(2000)
    * click("//*[@id='add-to-cart-sauce-labs-bike-light']")
    * delay(2000)
    * scroll("//*[@id='item_3_title_link']")
    * delay(2000)
    * click("//*[@id='add-to-cart-test.allthethings()-t-shirt-(red)']")
    * delay(2000)
    # check if 3 items are added or not
    * def cart_items5 = text("//*[@id='shopping_cart_container']/a/span")
    * match cart_items5 == '3'
    # navigate to cart icon and click
    * scroll("//*[@id='shopping_cart_container']/a")
    * delay(3000)
    * click("//*[@id='shopping_cart_container']/a")
    * match driver.url == "https://www.saucedemo.com/cart.html"
    * delay(2000)
    # navigate to checkout
    * scroll("//*[@id='checkout']")
    * delay(3000)
    * click("//*[@id='checkout']")
    * delay(2000)
    * match driver.url == "https://www.saucedemo.com/checkout-step-one.html"
    # Enter information
    And input("//*[@id='first-name']",'Shashi')
    * delay(2000)
    And input("//*[@id='last-name']",'Mane')
    * delay(2000)
    And input("//*[@id='postal-code']",'411014')
    * delay(2000)
    When click("//*[@id='continue']")
    * delay(2000)
    And match driver.url == 'https://www.saucedemo.com/checkout-step-two.html'
    # click on finish
    * scroll("//*[@id='finish']")
    * delay(3000)
    * click("//*[@id='finish']")
    * delay(2000)
    # thank you page
    * match driver.url == "https://www.saucedemo.com/checkout-complete.html"
    And scroll("//*[@id='back-to-products']").click()
    # verify home page
    * match driver.url == "https://www.saucedemo.com/inventory.html"
    * delay(3000)
