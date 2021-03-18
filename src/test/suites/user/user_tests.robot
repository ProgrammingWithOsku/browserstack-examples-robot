*** Settings ***
Library  SeleniumLibrary
Library  Collections
Library  OperatingSystem
Library  String

Resource  ${CURDIR}/../../../../resources/conf/runners/keywords.robot
Resource  ${CURDIR}/../../../app/pages/Login.robot
Resource  ${CURDIR}/../../../app/pages/Checkout.robot
Resource  ${CURDIR}/../../../app/pages/HomePage.robot
Resource  ${CURDIR}/../../../app/pages/Confirmation.robot
Resource  ${CURDIR}/../../../app/pages/Favourites.robot


*** Test Cases ***
# Test case 5
Check Login with image_not_loading_user

    Start Test  ${testType}

    Login.Login  image_not_loading_user  testingisfun99

    Check If Username Is    image_not_loading_user

    Sleep   3
    [Teardown]   Stop Test  ${testType}

# Test Case 6
Check Order in existing_orders_user

    Start Test  ${testType}
    Login.Login  existing_orders_user  testingisfun99

    Click On Orders
    Confirm Order Greater Than Zero

    Sleep   3
    [Teardown]   Stop Test  ${testType}

# Test Case 7
Add fav and check fav Count

    Start Test  ${testType}
    Login.Login  existing_orders_user  testingisfun99

    Favourites.Add Item To Fav

    HomePage.Click On Favourites

    Favourites.Confirm Favourites Greater Than Zero

    Sleep   3
    [Teardown]   Stop Test  ${testType}
