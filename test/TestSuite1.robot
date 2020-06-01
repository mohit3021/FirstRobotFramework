*** Settings ***
Library    SeleniumLibrary  
Suite Setup    Log    This will run only once before the Test Suite    
Suite Teardown    Log    This will run only once after the Test Suite    
Test Setup    Log    This will run befor each and every test case    
Test Teardown    Log    This will run after each and every test case    

Force Tags    sanity


*** Variables ***
${driverpath}    D:/Software/chromedriver.exe
${URL}    https://opensource-demo.orangehrmlive.com
@{Credentials}    admin    admin123
&{LOGINDATA}    username=admin    password=admin123


*** Keywords ***
LoginKW
    Input Text    id=txtUsername    @{Credentials}[0]
    Input Password    id=txtPassword    &{LOGINDATA}[password]
    Click Element    id=btnLogin 

*** Test Cases ***
    
FirstSeleniumTest
    [Tags]    smoke1
    Open Browser    https://google.com    chrome    executable_path=${driverpath}
    Set Selenium Implicit Wait    10s      
    Input Text    name=q    Autpmation step by Step
    Press Keys    name=q    ENTER
    sleep    2s
    Close Browser    
    
SimpleLoginTest
    [Tags]    smoke2
    Open Browser   ${URL}    chrome
    Maximize Browser Window
    Set Browser Implicit Wait    10s
    LoginKW  
    Click Element    xpath=.//*[text()='Welcome Admin']    
    Sleep    2s    
    Click Element    xpath=.//*[text()='Logout'] 
    Close Browser
    Log    This Test is executed by %{username} on %{os}
    Log    This is for my build-in functionn ${TEST NAME}        
    
    
       