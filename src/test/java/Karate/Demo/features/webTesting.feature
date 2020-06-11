@ignore
Feature: browser automation 1

Background:
  # * configure driver = { type: 'chrome', showDriverLog: true }
  # * configure driverTarget = { docker: 'justinribeiro/chrome-headless', showDriverLog: true }
  # * configure driverTarget = { docker: 'ptrthomas/karate-chrome', showDriverLog: true }
   * configure driver = { type: 'driver/chromedriver', showDriverLog: true }
  # * configure driver = { type: 'geckodriver', showDriverLog: true }
  # * configure driver = { type: 'safaridriver', showDriverLog: true }
  #* configure driver = { type: 'iedriver', showDriverLog: true, httpConfig: { readTimeout: 120000 } }

Scenario: google search and get code
  
  Given driver 'https://google.com'
  And input("input[name=q]", 'Bankia psd2')
  When submit().click("input[name=btnI]")
  And delay(5000)
  * def URL_Code = driver.url
  Then print 'URL ---> ',URL_Code
