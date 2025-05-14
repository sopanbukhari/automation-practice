*** Settings ***
Resource    ../Resources/Resource.robot


*** Variables ***
# @{PAGENAME_JENIS ELEMENT_NAMA ELEMENT}
${HOME_CATEGORY_LABEL}                      //h2[normalize-space()='Category']
${HOME_CATEGORY_SIDEBAR}                    //*[@id="accordian"]/div[1]/div[1]/h4/a
${HOME_CATEGORY_WOMEN}                      //*[@id="Women"]/div/ul/li[1]/a
${HOME_CATEGORY_LABEL_PRODUCTS}             //h2[@class='title text-center']
${HOME_CATEGORY_MEN}                        //*[@id="accordian"]/div[2]/div[1]/h4/a

${HOME_PRODUCTS}                            //*[@id="header"]/div/div/div/div[2]/div/ul/li[2]/a
${HOME_PRODUCTS_BRANDS_LABEL}               //h2[normalize-space()='Brands']
${HOME_PRODUCTS_BRANDS_POLO}                //a[@href='/brand_products/Polo']
${HOME_PRODUCTS_BRANDS_LABEL_PRODUCT}       //h2[@class='title text-center']
${HOME_PRODUCTS_BRANDS_OTHER}               //a[@href='/brand_products/H&M']

${HOME_PRODUCTS_LABEL}                      //h2[@class='title text-center']
${HOME_FORM_SEARCH}                         //input[@id='search_product']
${HOME_PRODUCTS_ADD_CART}                   //div[@class='overlay-content']//a[@class='btn btn-default add-to-cart'][normalize-space()='Add to cart']
${HOME_VIEW_CART}                           //u[normalize-space()='View Cart']
${HOME_CART}                                //a[normalize-space()='Cart']
${HOME_LOGIN_SIGNUP}                        //a[normalize-space()='Signup / Login']
${LOGIN_FORM_EMAIL}                         //input[@data-qa='login-email']
${LOGIN_FORM_PASSWORD}                      //input[@placeholder='Password']
${LOGIN_BUTTON}                             //button[normalize-space()='Login']
${CART_LINK_VIEWCART}                       //u[normalize-space()='View Cart']
${CART_LABEL_PRODUCTS}                       //a[normalize-space()='Blue Top']

*** Keywords ***
Category Product
    [Arguments]    ${deskripsi}    ${Test Suite, Test Cases}
    Open Web automationexercise
    IF    'View Category Products' == '${deskripsi}'
        View Category Products
    ELSE IF    'View & Cart Brand Products' == '${deskripsi}'
        View Cart Brand Products
    ELSE IF    'Search Products and Verify Cart After Login' == '${deskripsi}'
        Search Products
    END

View Category Products
    Open Web AutomationExercise
    ${verifyCategory}    Get Text    ${HOME_CATEGORY_LABEL}
    Should Be Equal    ${verifyCategory}    CATEGORY
    Click Element    ${HOME_CATEGORY_SIDEBAR}
    Click Element    ${HOME_CATEGORY_WOMEN}
    ${verifyWomenDress}    Get Text    ${HOME_CATEGORY_LABEL_PRODUCTS}
    Should Be Equal    ${verifyWomenDress}    WOMEN - DRESS PRODUCTS
    Click Element    ${HOME_CATEGORY_MEN}
    ${verifyCategory}    Get Text    ${HOME_CATEGORY_LABEL}
    Should Be Equal    ${verifyCategory}    CATEGORY

View Cart Brand Products
    Open Web AutomationExercise
    Click Element    ${HOME_PRODUCTS}
    Scroll Element Into View    ${HOME_PRODUCTS_BRANDS_LABEL}
    ${verifyBrands}    Get Text    ${HOME_PRODUCTS_BRANDS_LABEL}
    Should Be Equal    ${verifyBrands}    BRANDS
    Click Element    ${HOME_PRODUCTS_BRANDS_LABEL}
    Click Element    ${HOME_PRODUCTS_BRANDS_POLO}
    ${verifyBrandsPolo}    Get Text    ${HOME_PRODUCTS_BRANDS_LABEL_PRODUCT}
    Should Be Equal    ${verifyBrandsPolo}    BRAND - POLO PRODUCTS
    Click Element    ${HOME_PRODUCTS_BRANDS_OTHER}
    ${verifyBrands}    Get Text    ${HOME_PRODUCTS_BRANDS_LABEL}
    Should Be Equal    ${verifyBrands}    BRANDS

Search Products
    Open Web AutomationExercise
    Click Element    ${HOME_PRODUCTS}
    Scroll Element Into View    ${HOME_PRODUCTS_LABEL}
    ${verifyAllProduct}    Get Text    ${HOME_PRODUCTS_LABEL}
    Should Be Equal    ${verifyAllProduct}    ALL PRODUCTS
    Scroll Element Into View    ${HOME_FORM_SEARCH}
    ${verifyAllProduct}    Get Text    ${HOME_FORM_SEARCH}
    # Scroll Element Into View    ${HOME_FORM_SEARCH}
    Input Text    ${HOME_FORM_SEARCH}    Premium Polo
    Scroll Element Into View    ${HOME_PRODUCTS_ADD_CART}
    ${verifyBrands}    Get Text    ${HOME_PRODUCTS_ADD_CART}
    Execute JavaScript    document.querySelector('a[data-product-id="1"]').click();
    Wait Until Element Is Visible    ${CART_LINK_VIEWCART}
    Click Element    ${HOME_VIEW_CART}
    Click Element    ${HOME_CART}
    Click Element    ${HOME_LOGIN_SIGNUP}
    Input Text    ${LOGIN_FORM_EMAIL}    testio@gmail.com
    Input Text    ${LOGIN_FORM_PASSWORD}    test123
    Click Element    ${LOGIN_BUTTON}
    Click Element    ${HOME_CART}
    ${verifyAllProduct}    Get Text    ${CART_LABEL_PRODUCTS}
    Should Be Equal    ${verifyAllProduct}    Blue Top
