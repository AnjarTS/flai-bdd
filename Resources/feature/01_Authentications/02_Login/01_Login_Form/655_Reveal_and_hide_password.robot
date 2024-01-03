*** Settings ***
Documentation    Reveal and hide password
Metadata         ID                           655
Metadata         Automation priority          null
Metadata         Test case importance         Low
Resource         squash_resources.resource
Test Setup       Test Setup
Test Teardown    Test Teardown


*** Test Cases ***
Reveal and hide password
    [Documentation]    Reveal and hide password

    Given User is on Login Page
    When User enter password "any_password"
    And Default password field is masked
    And User click reveal password
    Then Password revealed as "any_password"


*** Keywords ***
Test Setup
    [Documentation]    test setup
    ...                You can define the ${TEST_SETUP} variable with a keyword for setting up all your tests.
    ...                You can define the ${TEST_655_SETUP} variable with a keyword for setting up this specific test.
    ...                If both are defined, ${TEST_655_SETUP} will be run after ${TEST_SETUP}.

    ${TEST_SETUP_VALUE} =        Get Variable Value    ${TEST_SETUP}
    ${TEST_655_SETUP_VALUE} =    Get Variable Value    ${TEST_655_SETUP}
    IF    $TEST_SETUP_VALUE is not None
        Run Keyword    ${TEST_SETUP}
    END
    IF    $TEST_655_SETUP_VALUE is not None
        Run Keyword    ${TEST_655_SETUP}
    END

Test Teardown
    [Documentation]    test teardown
    ...                You can define the ${TEST_TEARDOWN} variable with a keyword for tearing down all your tests.
    ...                You can define the ${TEST_655_TEARDOWN} variable with a keyword for tearing down this specific test.
    ...                If both are defined, ${TEST_TEARDOWN} will be run after ${TEST_655_TEARDOWN}.

    ${TEST_655_TEARDOWN_VALUE} =    Get Variable Value    ${TEST_655_TEARDOWN}
    ${TEST_TEARDOWN_VALUE} =        Get Variable Value    ${TEST_TEARDOWN}
    IF    $TEST_655_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_655_TEARDOWN}
    END
    IF    $TEST_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_TEARDOWN}
    END
