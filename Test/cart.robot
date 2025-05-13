*** Settings ***
Resource    ../UI/cart.robot
Test Template    Menu home
Test Teardown    Close All Browsers

*** Test Cases ***
TC01 - Place Order: Register while Checkout   Place Order: Register while Checkout    ${SUITE_NAME} - ${TEST_NAME}
TC02 - Place Order: Register before Checkout    Place Order: Register before Checkout    ${SUITE_NAME} - ${TEST_NAME}
TC03 - Place Order: Login before Checkout    Place Order: Login before Checkout    ${SUITE_NAME} - ${TEST_NAME}
TC04 - Remove Products From Cart    Remove Products From Cart    ${SUITE_NAME} - ${TEST_NAME}