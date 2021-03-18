*** Settings ***
Library  SeleniumLibrary

*** Keywords ***

Click On Orders
    Wait Until Element Is Visible   id=orders
    Click Element   id=orders
    Wait Until Element Is Visible   class=order

Click On Favourites
    Wait Until Element Is Visible   id=favourites
    Click Element   id=favourites

Check If Username Is
    [Arguments]   ${username}
    Wait Until Element Is Visible   class=username
    Element Text Should Be    class=username    ${username}

    # Wait Until Element Is Visible   class=order

Select Lowest To Highest Filter
    Wait Until Element Is Visible   class=sort
    Click Element   class=sort

    Click Element   xpath=//*[@id="__next"]/div/div/main/div[2]/div[1]/div[1]/select/option[2]

Check If Product Sorted
    Wait Until Element Is Visible   class=val
    ${prices}=  Get Text  class=val

    Element Text Should Be  class=val   $399.00

Get Total Products
    Wait Until Element Is Visible   xpath=//span[contains(text(), 'Apple')]
    ${total_elements}=  Get Text  class=products-found

    [return]  ${total_elements}

Select Filter
    [Arguments]   ${filter}
    Click Element   xpath=//span[contains(text(), '${filter}')]


Check If Total Product Changed
    [Arguments]   ${total_elements_before}
    Element Text Should Not Be   class=products-found   ${total_elements_before}