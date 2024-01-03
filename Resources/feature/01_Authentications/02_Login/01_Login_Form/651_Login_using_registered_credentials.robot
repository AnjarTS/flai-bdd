*** Settings ***
Documentation    Login using registered credentials
Metadata         ID                           651
Metadata         Automation priority          null
Metadata         Test case importance         High
Resource         squash_resources.resource
Test Setup       Test Setup
Test Teardown    Test Teardown


*** Test Cases ***
Login using registered credentials
    [Documentation]    Login using registered credentials

    &{datatables} =    Retrieve Datatables

    Given User is on Login Page
    When User login with valid credentials "${datatables}[datatable_1]"
    Then User is redirected to OTP page


*** Keywords ***
Test Setup
    [Documentation]    test setup
    ...                You can define the ${TEST_SETUP} variable with a keyword for setting up all your tests.
    ...                You can define the ${TEST_651_SETUP} variable with a keyword for setting up this specific test.
    ...                If both are defined, ${TEST_651_SETUP} will be run after ${TEST_SETUP}.

    ${TEST_SETUP_VALUE} =        Get Variable Value    ${TEST_SETUP}
    ${TEST_651_SETUP_VALUE} =    Get Variable Value    ${TEST_651_SETUP}
    IF    $TEST_SETUP_VALUE is not None
        Run Keyword    ${TEST_SETUP}
    END
    IF    $TEST_651_SETUP_VALUE is not None
        Run Keyword    ${TEST_651_SETUP}
    END

Test Teardown
    [Documentation]    test teardown
    ...                You can define the ${TEST_TEARDOWN} variable with a keyword for tearing down all your tests.
    ...                You can define the ${TEST_651_TEARDOWN} variable with a keyword for tearing down this specific test.
    ...                If both are defined, ${TEST_TEARDOWN} will be run after ${TEST_651_TEARDOWN}.

    ${TEST_651_TEARDOWN_VALUE} =    Get Variable Value    ${TEST_651_TEARDOWN}
    ${TEST_TEARDOWN_VALUE} =        Get Variable Value    ${TEST_TEARDOWN}
    IF    $TEST_651_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_651_TEARDOWN}
    END
    IF    $TEST_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_TEARDOWN}
    END

Retrieve Datatables
    [Documentation]    Retrieves Squash TM's datatables and stores them in a dictionary.
    ...
    ...                For instance, 2 datatables have been defined in Squash TM,
    ...                the first one containing data:
    ...                | name | firstName |
    ...                | Bob  |   Smith   |
    ...                the second one containing data
    ...                | name  | firstName | age |
    ...                | Alice |   Smith   | 45  |
    ...
    ...                First, for each datatable, this keyword retrieves the values of each row
    ...                and stores them in a list, as follows:
    ...                @{row_1_1} =    Create List    name    firstName
    ...
    ...                Then, for each datatable, this keyword creates a list containing all the rows,
    ...                as lists themselves, as follows:
    ...                @{datatable_1} =    Create List    ${row_1_1}    ${row_1_2}
    ...
    ...                Finally, this keyword stores the datatables into the &{datatables} dictionary
    ...                with each datatable name as key, and each datatable list as value :
    ...                &{datatables} =    Create Dictionary    datatable_1=${datatable_1}    datatable_2=${datatable_2}

    @{row_1_1} =    Create List    email                     password
    @{row_1_2} =    Create List    feedloop.qa\@gmail.com    QAFeedloop\@123
    @{datatable_1} =    Create List    ${row_1_1}    ${row_1_2}

    &{datatables} =    Create Dictionary    datatable_1=${datatable_1}

    RETURN    &{datatables}
