*** Settings ***
Resource    ../Resources/Resource.robot



*** Variables ***
# @{PAGENAME_JENIS ELEMENT_NAMA ELEMENT}
${HOME_TAB_PRODUCTS}    //a[@href='/products']
${PRODUCTS_BUTTON_VIEWPRODUCTS}    //div[@class='col-sm-9 padding-right']//div[2]//div[1]//div[2]//ul[1]//li[1]//a[1]
${PRODUCTDETAILS_INPUTTEXT_NAME}    //input[@id='name']
${PRODUCTDETAILS_INPUTTEXT_EMAIL}    //input[@id='email']
${PRODUCTDETAILS_INPUTTEXT_REVIEW}    //textarea[@id='review']
${PRODUCTDETAILS_BUTTON_SUBMIT}    //button[@id='button-review']
${PRODUCTS_LABEL_ALLPRODUCTS}    //h2[@class='title text-center']
${PRODUCTDETAILS_LABEL_WRITEREVIEW}    //a[normalize-space()='Write Your Review']
${HOME_TAB_HOME}    //a[normalize-space()='Home']
${HOME_LABEL_RECOMMENDEDITEMS}    //h2[normalize-space()='recommended items']
${RECOMMENDEDITEMS_BUTTON_ADDTOCART}    //div[@class='item active']//div[1]//div[1]//div[1]//div[1]//a[1]
${CART_LINK_VIEWCART}    //u[normalize-space()='View Cart']
${CART_LABEL_PRODUCTS}    //a[normalize-space()='Blue Top']
${HOME_TAB_SIGNUP}    //a[normalize-space()='Signup / Login']
${SIGNUP_INPUTTEXT_NAME}    //input[@placeholder='Name']
${SIGNUP_INPUTTEXT_EMAIL}    //input[@data-qa='signup-email']
${SIGNUP_BUTTON_SIGNUP}    //button[normalize-space()='Signup']
${SIGNUP_RADIOBUTTON_GENDERMALE}    id_gender1
${SIGNUP_INPUTTEXT_PASSWORD}    //input[@id='password']
${SIGNUP_DROPDOWN_DATE}    //select[@id='days']
${SIGNUP_DROPDOWN_MONTH}    //select[@id='months']
${SIGNUP_DROPDOWN_YEAR}    //select[@id='years']
${SIGNUP_INPUTTEXT_FIRSTNAME}    //input[@id='first_name']
${SIGNUP_INPUTTEXT_LASTNAME}    //input[@id='last_name']
${SIGNUP_INPUTTEXT_ADDRESS}    //input[@id='address1']
${SIGNUP_DROPDOWN_COUNTRY}    //select[@id='country']
${SIGNUP_INPUTTEXT_STATE}    //input[@id='state']
${SIGNUP_INPUTTEXT_CITY}    //input[@id='city']
${SIGNUP_INPUTTEXT_ZIPCODE}    //input[@id='zipcode']
${SIGNUP_INPUTTEXT_PHONE}    //input[@id='mobile_number']
${SIGNUP_BUTTON_CREATE}    //button[normalize-space()='Create Account']
${SIGNUP_LABEL_CREATED}    //b[normalize-space()='Account Created!']
${SIGNUP_BUTTON_CONTINUE}    //a[@class='btn btn-primary']
${LOGIN_LABEL_LOGOUT}    //a[normalize-space()='Logout']
${LOGIN_BUTTON_DELETEACCOUNT}    //a[normalize-space()='Delete Account']
${HOME_BUTTON_ADDTOCART}    xpath=//a[contains(@class, 'add-to-cart') and @data-product-id="1"]    
${CART_BUTTON_CHECKOUT}    //a[@class='btn btn-default check_out']
#@{CHECKOUT_LABEL_DELIVERYADDRESS}    //h3[normalize-space()='Your delivery address']
#@{CHECKOUT_LABEL_BILLINGADDRESS}    //h3[normalize-space()='Your billing address']
${LOGIN_LABEL_DELETEACCOUNT}    //b[normalize-space()='Account Deleted!']


*** Keywords ***
Menu Cart and Product
    [Arguments]    ${deskripsi}    ${Test Suite, Test Cases}
    Open Web automationexercise
    IF    'Add new review on product' == '${deskripsi}'
        Add new review
    ELSE IF    'Add to cart' == '${deskripsi}'
        Add to cart
    ELSE IF    'Verify address details' == '${deskripsi}'
        Verify address details
    END

Add new review
    Click Element    ${HOME_TAB_PRODUCTS}
    ${verifyAllProduct}    Get Text    ${PRODUCTS_LABEL_ALLPRODUCTS}
    Should Be Equal    ${verifyAllProduct}    ALL PRODUCTS
    Scroll Element Into View    ${PRODUCTS_BUTTON_VIEWPRODUCTS}
    Click Element    ${PRODUCTS_BUTTON_VIEWPRODUCTS}
    ${verifyWriteReview}    Get Text    ${PRODUCTDETAILS_LABEL_WRITEREVIEW}
    Should Be Equal    ${verifyWriteReview}    WRITE YOUR REVIEW
    Scroll Element Into View    ${PRODUCTDETAILS_INPUTTEXT_NAME}
    Input Text    ${PRODUCTDETAILS_INPUTTEXT_NAME}    test
    Input Text    ${PRODUCTDETAILS_INPUTTEXT_EMAIL}    test@gmail.com
    Scroll Element Into View    ${PRODUCTDETAILS_INPUTTEXT_REVIEW}
    Input Text    ${PRODUCTDETAILS_INPUTTEXT_REVIEW}    good products!
    Scroll Element Into View    ${PRODUCTDETAILS_BUTTON_SUBMIT}
    Click Element    ${PRODUCTDETAILS_BUTTON_SUBMIT}
    Wait Until Page Contains    Thank you for your review.    30s   

Add to cart
    ${verifyHome}    Get Text    ${HOME_TAB_HOME}
    Should Be Equal    ${verifyHome}     Home
    Scroll Element Into View    ${HOME_LABEL_RECOMMENDEDITEMS}
    Click Element    ${RECOMMENDEDITEMS_BUTTON_ADDTOCART}
    Wait Until Element Is Visible    ${CART_LINK_VIEWCART}    5s
    Click Element    ${CART_LINK_VIEWCART}
    ${verifyProduct}    Get Text    ${CART_LABEL_PRODUCTS}
    Should Be Equal    ${verifyProduct}    Blue Top

Verify address details
    ${verifyHome}    Get Text    ${HOME_TAB_HOME}
    Should Be Equal    ${verifyHome}     Home
    Click Element    ${HOME_TAB_SIGNUP}
    Input Text    ${SIGNUP_INPUTTEXT_NAME}    test
    Input Text    ${SIGNUP_INPUTTEXT_EMAIL}    rey@gmail.com
    Click Element    ${SIGNUP_BUTTON_SIGNUP}
    Click Element    id=${SIGNUP_RADIOBUTTON_GENDERMALE}
    Input Password    ${SIGNUP_INPUTTEXT_PASSWORD}    test123
    Scroll Element Into View    ${SIGNUP_DROPDOWN_DATE}
    Select From List By Value    ${SIGNUP_DROPDOWN_DATE}    1
    Select From List By Value    ${SIGNUP_DROPDOWN_MONTH}    1
    Select From List By Value    ${SIGNUP_DROPDOWN_YEAR}    2000
    Scroll Element Into View    ${SIGNUP_INPUTTEXT_FIRSTNAME}
    Input Text    ${SIGNUP_INPUTTEXT_FIRSTNAME}    test
    Scroll Element Into View    ${SIGNUP_INPUTTEXT_LASTNAME}
    Input Text    ${SIGNUP_INPUTTEXT_LASTNAME}    QA
    Scroll Element Into View    ${SIGNUP_INPUTTEXT_ADDRESS}
    Input Text    ${SIGNUP_INPUTTEXT_ADDRESS}    TEST123    
    Scroll Element Into View    ${SIGNUP_DROPDOWN_COUNTRY}
    Select From List By Value    ${SIGNUP_DROPDOWN_COUNTRY}    Singapore
    Scroll Element Into View    ${SIGNUP_INPUTTEXT_STATE}
    Input Text    ${SIGNUP_INPUTTEXT_STATE}    SG
    Scroll Element Into View    ${SIGNUP_INPUTTEXT_CITY}
    Input Text    ${SIGNUP_INPUTTEXT_CITY}    Singapore
    Scroll Element Into View    ${SIGNUP_INPUTTEXT_ZIPCODE}
    Input Text    ${SIGNUP_INPUTTEXT_ZIPCODE}    1234
    Scroll Element Into View    ${SIGNUP_INPUTTEXT_PHONE}
    Input Text    ${SIGNUP_INPUTTEXT_PHONE}    123456789
    Scroll Element Into View    ${SIGNUP_BUTTON_CREATE}
    Wait Until Element Is Visible    ${SIGNUP_BUTTON_CREATE}
    Click Element    ${SIGNUP_BUTTON_CREATE}
    ${verifyAccountCreated}    Get Text    ${SIGNUP_LABEL_CREATED}
    Should Be Equal    ${verifyAccountCreated}    ACCOUNT CREATED!
    Click Element    ${SIGNUP_BUTTON_CONTINUE}
    Wait Until Element Is Visible    ${HOME_BUTTON_ADDTOCART}    10s
    Scroll Element Into View    ${HOME_BUTTON_ADDTOCART}
    Execute JavaScript    document.querySelector('a[data-product-id="1"]').click();
    Wait Until Element Is Visible    ${CART_LINK_VIEWCART}
    Click Element    ${CART_LINK_VIEWCART}
    Wait Until Element Is Visible    ${CART_BUTTON_CHECKOUT}
    Click Element    ${CART_BUTTON_CHECKOUT}
    Wait Until Page Contains    Your delivery address    5s
    Wait Until Page Contains    Your billing address    5s
    Click Element    ${LOGIN_BUTTON_DELETEACCOUNT}
    ${verifyAccountDeleted}    Get Text    ${LOGIN_LABEL_DELETEACCOUNT}
    Should Be Equal    ${verifyAccountDeleted}    ACCOUNT DELETED!





    
