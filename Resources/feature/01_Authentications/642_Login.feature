# language: en
Feature: Login
  
  As an registered user,
  Andy want to login,
  In order to use the app
  
  Scenario: Login using valid credentials
    Given Andy already on Login page
    When Andy login using valid credentials
    And Andy enter correct OTP
    Then Andy is logged in