*** Settings ***
Documentation    Login using invalid email format
Metadata         ID                           653
Metadata         Automation priority          null
Metadata         Test case importance         Medium
Resource         squash_resources.resource
Test Setup       Test Setup
Test Teardown    Test Teardown


*** Test Cases ***
Login using invalid email format
    [Documentation]    Login using invalid email format

    Given User is on Login Page
    When When User login using invalid email format
    Then Message "invalid combination of email and password" appeared


*** Keywords ***
Test Setup
    [Documentation]    test setup
    ...                You can define the ${TEST_SETUP} variable with a keyword for setting up all your tests.
    ...                You can define the ${TEST_653_SETUP} variable with a keyword for setting up this specific test.
    ...                If both are defined, ${TEST_653_SETUP} will be run after ${TEST_SETUP}.

    ${TEST_SETUP_VALUE} =        Get Variable Value    ${TEST_SETUP}
    ${TEST_653_SETUP_VALUE} =    Get Variable Value    ${TEST_653_SETUP}
    IF    $TEST_SETUP_VALUE is not None
        Run Keyword    ${TEST_SETUP}
    END
    IF    $TEST_653_SETUP_VALUE is not None
        Run Keyword    ${TEST_653_SETUP}
    END

Test Teardown
    [Documentation]    test teardown
    ...                You can define the ${TEST_TEARDOWN} variable with a keyword for tearing down all your tests.
    ...                You can define the ${TEST_653_TEARDOWN} variable with a keyword for tearing down this specific test.
    ...                If both are defined, ${TEST_TEARDOWN} will be run after ${TEST_653_TEARDOWN}.

    ${TEST_653_TEARDOWN_VALUE} =    Get Variable Value    ${TEST_653_TEARDOWN}
    ${TEST_TEARDOWN_VALUE} =        Get Variable Value    ${TEST_TEARDOWN}
    IF    $TEST_653_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_653_TEARDOWN}
    END
    IF    $TEST_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_TEARDOWN}
    END
