*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Variables ***
@{LIST_LOGIN}    demo  mode
...  &{DICT_LOGIN}   username=demo   password=mode

*** Test Cases ***
Valid Login
    [Tags]  Login Successful
    Open Browser To Login Page
    Input Username    @{LIST_LOGIN}[0]
    Input Password    @{LIST_LOGIN}[1]
    Submit Credentials
    Welcome Page Should Be Open
    [Teardown]    Close Browser
