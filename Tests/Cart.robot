*** Settings ***
Resource    ../UI/Cart.robot
Test Template    Menu Cart and Product
Test Teardown    Close All Browsers

*** Test Cases ***
TC01 - Add review on product    Add new review on product        ${SUITE_NAME} - ${TEST_NAME}
TC02 - Add to cart from Recommended items    Add to cart        ${SUITE_NAME} - ${TEST_NAME}
TC03 - Verify address details in checkout page    Verify address details        ${SUITE_NAME} - ${TEST_NAME}