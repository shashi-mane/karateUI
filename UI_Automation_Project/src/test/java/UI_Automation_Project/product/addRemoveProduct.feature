Feature: Add single product to cart

  Background: logged in successfully
    Given call read("../user_login.feature")

  Scenario Outline: Add single product to cart
    * scroll("//*[@id='item_5_title_link']")
    * delay(2000)
    # click on product name
    * click("//*[@id='item_5_title_link']")
    * match driver.url == "<product_page>"
    * delay(3000)
    # add product to cart from product page
    * click("//*[@id='add-to-cart']")
    * delay(3000)
    # check if item is added or not
    * def cart_items1 = text("//*[@id='shopping_cart_container']/a/span")
    * match cart_items1 == '1'
    # navigate to cart
    * scroll("//*[@id='shopping_cart_container']/a")
    * delay(2000)
    * click("//*[@id='shopping_cart_container']/a")
    * match driver.url == "<cart_page>"
    * delay(3000)
    # remove item from cart
    * click("//*[@id='remove-sauce-labs-fleece-jacket']")
    * delay(3000)
    # continue shopping
    * click("//*[@id='continue-shopping']")
    * delay(2000)
    * match driver.url == "<homepage>"
    # add multiple item to cart
    * click("//*[@id='add-to-cart-sauce-labs-backpack']")
    * delay(2000)
    * scroll("//*[@id='item_0_title_link']")
    * delay(2000)
    * click("//*[@id='add-to-cart-sauce-labs-bike-light']")
    * delay(2000)
    * scroll("//*[@id='item_3_title_link']")
    * delay(3000)
    * click("//*[@id='add-to-cart-test.allthethings()-t-shirt-(red)']")
    * delay(3000)
    # check if 3 items are added or not
    * def cart_items5 = text("//*[@id='shopping_cart_container']/a/span")
    * match cart_items5 == '3'
    # navigate to cart icon and click
    * scroll("//*[@id='shopping_cart_container']/a")
    * delay(3000)
    * click("//*[@id='shopping_cart_container']/a")
    * match driver.url == "<cart_page>"
    * delay(3000)
    * back()
    * match driver.url == "<homepage>"
    * click("//*[@id='remove-sauce-labs-backpack']")
    * delay(2000)
    # navigate to cart icon and click
    * scroll("//*[@id='shopping_cart_container']/a")
    * delay(2000)
    * click("//*[@id='shopping_cart_container']/a")
    * match driver.url == "<cart_page>"
    * delay(2000)

    Examples: 
      | homepage                                 | cart_page                           | product_page                                       |
      | https://www.saucedemo.com/inventory.html | https://www.saucedemo.com/cart.html | https://www.saucedemo.com/inventory-item.html?id=5 |
