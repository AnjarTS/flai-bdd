# language: en
Feature: Login
  
  As an registered user,
  Andy want to login,
  In order to use the app
  
  Background: Already on Login Page
    Given Andy is on Login Page
  
  Scenario: Login using valid credentials
    When Andy login using valid credentials
    And Andy enter correct OTP
    Then Andy is logged in
    
  Scenario: Login using unregistered credentials
    When Andy login using unregistered credentials
    Then Message "invalid combination of email and password" appeared