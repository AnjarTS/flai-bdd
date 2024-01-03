*** Settings ***
Documentation    Login using wrong password
Metadata         ID                           654
Metadata         Automation priority          null
Metadata         Test case importance         Medium
Resource         squash_resources.resource
Test Setup       Test Setup
Test Teardown    Test Teardown


*** Test Cases ***
Login using wrong password
    [Documentation]    Login using wrong password

    Given User is on Login Page
    When User login using wrong password
    Then Message "invalid combination of email and password" appeared


*** Keywords ***
Test Setup
    [Documentation]    test setup
    ...                You can define the ${TEST_SETUP} variable with a keyword for setting up all your tests.
    ...                You can define the ${TEST_654_SETUP} variable with a keyword for setting up this specific test.
    ...                If both are defined, ${TEST_654_SETUP} will be run after ${TEST_SETUP}.

    ${TEST_SETUP_VALUE} =        Get Variable Value    ${TEST_SETUP}
    ${TEST_654_SETUP_VALUE} =    Get Variable Value    ${TEST_654_SETUP}
    IF    $TEST_SETUP_VALUE is not None
        Run Keyword    ${TEST_SETUP}
    END
    IF    $TEST_654_SETUP_VALUE is not None
        Run Keyword    ${TEST_654_SETUP}
    END

Test Teardown
    [Documentation]    test teardown
    ...                You can define the ${TEST_TEARDOWN} variable with a keyword for tearing down all your tests.
    ...                You can define the ${TEST_654_TEARDOWN} variable with a keyword for tearing down this specific test.
    ...                If both are defined, ${TEST_TEARDOWN} will be run after ${TEST_654_TEARDOWN}.

    ${TEST_654_TEARDOWN_VALUE} =    Get Variable Value    ${TEST_654_TEARDOWN}
    ${TEST_TEARDOWN_VALUE} =        Get Variable Value    ${TEST_TEARDOWN}
    IF    $TEST_654_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_654_TEARDOWN}
    END
    IF    $TEST_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_TEARDOWN}
    END
