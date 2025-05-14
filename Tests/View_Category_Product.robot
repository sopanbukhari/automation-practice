*** Settings ***
Resource    ../UI/View_Category_Product.robot
Test Template    Category Product
Test Teardown    Close All Browsers

*** Test Cases ***
TC01 - View Category Products   View Category Products  ${SUITE_NAME} - ${TEST_NAME}
TC02 - View Cart Brand Products   View & Cart Brand Products  ${SUITE_NAME} - ${TEST_NAME}
TC03 - Search Products  Search Products and Verify Cart After Login  ${SUITE_NAME} - ${TEST_NAME}
