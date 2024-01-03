*** Settings ***
Documentation    Login using unregistered credentials
Metadata         ID                           652
Metadata         Automation priority          null
Metadata         Test case importance         High
Resource         squash_resources.resource
Test Setup       Test Setup
Test Teardown    Test Teardown


*** Test Cases ***
Login using unregistered credentials
    [Documentation]    Login using unregistered credentials

    Given User is on Login Page
    When User login using unregistered credentials
    Then Message "invalid combination of email and password" appeared


*** Keywords ***
Test Setup
    [Documentation]    test setup
    ...                You can define the ${TEST_SETUP} variable with a keyword for setting up all your tests.
    ...                You can define the ${TEST_652_SETUP} variable with a keyword for setting up this specific test.
    ...                If both are defined, ${TEST_652_SETUP} will be run after ${TEST_SETUP}.

    ${TEST_SETUP_VALUE} =        Get Variable Value    ${TEST_SETUP}
    ${TEST_652_SETUP_VALUE} =    Get Variable Value    ${TEST_652_SETUP}
    IF    $TEST_SETUP_VALUE is not None
        Run Keyword    ${TEST_SETUP}
    END
    IF    $TEST_652_SETUP_VALUE is not None
        Run Keyword    ${TEST_652_SETUP}
    END

Test Teardown
    [Documentation]    test teardown
    ...                You can define the ${TEST_TEARDOWN} variable with a keyword for tearing down all your tests.
    ...                You can define the ${TEST_652_TEARDOWN} variable with a keyword for tearing down this specific test.
    ...                If both are defined, ${TEST_TEARDOWN} will be run after ${TEST_652_TEARDOWN}.

    ${TEST_652_TEARDOWN_VALUE} =    Get Variable Value    ${TEST_652_TEARDOWN}
    ${TEST_TEARDOWN_VALUE} =        Get Variable Value    ${TEST_TEARDOWN}
    IF    $TEST_652_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_652_TEARDOWN}
    END
    IF    $TEST_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_TEARDOWN}
    END
