*** Settings ***
Resource    ../Resources/Resource.robot

Library    String

*** Variables ***
# @{PAGENAME_JENIS ELEMENT_NAMA ELEMENT}
@{HOME_BUTTON_HOME}        //a[normalize-space()='Home']
@{HOME_BUTTON_CART}        //a[normalize-space()='Cart']//i[@class='fa fa-shopping-cart']
@{HOME_BUTTON_SIGNUP/LOGIN}        //a[normalize-space()='Signup / Login']
@{HOME_LOGIN_INPUTEMAIL}        //input[@data-qa='login-email']
@{HOME_LOGIN_INPUTPASSWORD}     //input[@placeholder='Password']
@{HOME_LOGIN_BUTTONLOGIN}       //button[normalize-space()='Login']
@{HOME_LOGIN_VERIVIEDLOGGEDIN}        //i[@class='fa fa-user']
@{CART_VERIFYTEXT_SHOPPINGCART1}    //li[@class='active']
@{CART_LINK_CLICKHERE}         //u[normalize-space()='here']
@{CART_BUTTON_ADDTOCART}        //body[1]/section[2]/div[1]/div[1]/div[2]/div[1]/div[3]/div[1]/div[1]/div[1]/a[1]
@{CART_TEXT_ADDED}        //h4[@class='modal-title w-100']
@{CART_BUTTON_VIEWCART}        //p[@class='text-center']//a
@{CART_TEXT_SHOPPINGCART2}        //li[@class='active']
@{CART_ICON_X}        //i[@class='fa fa-times']
@{CART_VERIFY_DELETEDITEMS}        //b[normalize-space()='Cart is empty!']
@{CART_BUTTON_PROCCEEDTOCHECKOUT}        //a[normalize-space()='Proceed To Checkout']
@{CART_LINK_REGISTER/LOGIN}        //div[@class='modal-body']//a
@{CART_INPUT_USERNAME}        //input[@placeholder='Name']
@{CART_INPUT_EMAIL}        //input[@data-qa='signup-email']
@{CART_BUTTON_SIGNUP}        //button[normalize-space()='Signup']
@{CART_TEXT_REGISTERPAGE}        //b[normalize-space()='Enter Account Information']
@{CART_SIGNUP_SELECTGENDER}        //input[@id='id_gender1']
@{CART_SIGNUP_PASSWORD}        //input[@id='password']
@{CART_SIGNUP_DATE}        //select[@id='days']     
@{CART_SIGNUP_MONTH}        //select[@id='months']   
@{CART_SIGNUP_YEAR}        //select[@id='years']
@{CART_SIGNUP_INPUTFIRSTNAME}    //input[@id='first_name']
@{CART_SIGNUP_INPUTLASTNAME}     //input[@id='last_name']
@{CART_SIGNUP_INPUTADDRESS}      //input[@id='address1']
@{CART_SIGNUP_SELECTCOUNTRY}     //select[@id='country']
@{CART_SIGNUP_INPUTSTATE}        //input[@id='state']
@{CART_SIGNUP_INPUTCITY}         //input[@id='city']
@{CART_SIGNUP_INPUTZIPCODE}     //input[@id='zipcode']
@{CART_SIGNUP_INPUTMOBILENUMBER}    //input[@id='mobile_number']
@{CART_SIGNUP_CLICKCREATEACCOUNT}    //button[normalize-space()='Create Account']
@{CART_SIGNUP_VERIFIEDACCOUNTCREATED}        //b[normalize-space()='Account Created!']
@{CART_SIGNUP_BUTTONCONTINUE}        //a[normalize-space()='Continue']
@{CART_SIGNUP_VERIFIEDLOGGEDIN}        //header[@id='header']//li[1]//a[1]
@{CART_CHECKOUT_VERIFYTEXTREVIEWYOURORDER}        //h2[normalize-space()='Review Your Order']
@{CART_CHECKOUT_INPUTCOMMENTFIELD}        //textarea[@name='message']
@{CART_CHECKOUT_BUTTONPLACEORDER}        //a[normalize-space()='Place Order']
@{CART_PAYMENT_NAMEONCARD}        //input[@name='name_on_card']
@{CART_PAYMENT_CARDNUMBER}        //input[@name='card_number']
@{CART_PAYMENT_CVC}        //input[@placeholder='ex. 311']
@{CART_PAYMENT_MONTH}        //input[@placeholder='MM']
@{CART_PAYMENT_YEAR}         //input[@placeholder='YYYY']
@{CART_PAYMENT_BUTTONPAYANDCONFIRMORDER}    //button[@id='submit']
@{CART_PAYMENT_VERIVIEDORDERPLACED}        //b[normalize-space()='Order Placed!']
@{CART_BUTTON_DELETEACCOUNT}        //a[normalize-space()='Delete Account']
@{CART_TEXT_ACCOUNTDELETED}        //b[normalize-space()='Account Deleted!']



*** Keywords ***
Menu home
    [Arguments]    ${deskripsi}    ${Test Suite, Test Cases}
    Open Web Automation Exercise
    Click Element    @{HOME_BUTTON_HOME}
    IF    'Place Order: Register while Checkout' == '${deskripsi}'
            Place Order: Register while Checkout 
    ELSE IF    'Place Order: Register before Checkout' == '${deskripsi}'
            Place Order: Register before Checkout
    ELSE IF    'Place Order: Login before Checkout' == '${deskripsi}'
            Place Order: Login before Checkout
    ELSE IF    'Remove Products From Cart' == '${deskripsi}'
            Remove Products From Cart
    END


Place Order: Register while Checkout
    Click Element    @{HOME_BUTTON_CART}
    Get Text        @{CART_VERIFYTEXT_SHOPPINGCART1}
    Click Element    @{CART_LINK_CLICKHERE}
    Click Element    @{CART_BUTTON_ADDTOCART}
    Get Text    @{CART_TEXT_ADDED}
    Click Element    @{CART_BUTTON_VIEWCART}
    Get Text    @{CART_TEXT_SHOPPINGCART2}
    Click Element    @{CART_BUTTON_PROCCEEDTOCHECKOUT}
    Click Element    @{CART_LINK_REGISTER/LOGIN}
    Input Text    @{CART_INPUT_USERNAME}    Ibnukemaltes
    Input Text    @{CART_INPUT_EMAIL}    ibnukemaltest@testmail.com
    Click Element    @{CART_BUTTON_SIGNUP}
    Get Text    @{CART_TEXT_REGISTERPAGE}
    Click Element    @{CART_SIGNUP_SELECTGENDER}
    Input Text    @{CART_SIGNUP_PASSWORD}    Ibnu.test0
    Select From List By Value    @{CART_SIGNUP_DATE}    5
    Select From List By Value    @{CART_SIGNUP_MONTH}    4
    Select From List By Value    @{CART_SIGNUP_YEAR}    2001
    Input Text    @{CART_SIGNUP_INPUTFIRSTNAME}    Automation
    Input Text    @{CART_SIGNUP_INPUTLASTNAME}    Testing0
    Input Text    @{CART_SIGNUP_INPUTADDRESS}    Testing Address
    Select From List By Index    @{CART_SIGNUP_SELECTCOUNTRY}    2
    Input Text    @{CART_SIGNUP_INPUTSTATE}    Test
    Input Text    @{CART_SIGNUP_INPUTCITY}    Test
    Input Text    @{CART_SIGNUP_INPUTZIPCODE}    12345
    Input Text    @{CART_SIGNUP_INPUTMOBILENUMBER}    081111111
    Click Element    @{CART_SIGNUP_CLICKCREATEACCOUNT}
    Get Text    @{CART_SIGNUP_VERIFIEDACCOUNTCREATED}
    Click Element     @{CART_SIGNUP_BUTTONCONTINUE}
    Get Text    @{CART_SIGNUP_VERIFIEDLOGGEDIN}
    Click Element    @{HOME_BUTTON_CART}
    Click Element    @{CART_BUTTON_PROCCEEDTOCHECKOUT}
    Get Text    @{CART_CHECKOUT_VERIFYTEXTREVIEWYOURORDER}
    Input Text    @{CART_CHECKOUT_INPUTCOMMENTFIELD}    Test Checkout
    Click Element      @{CART_CHECKOUT_BUTTONPLACEORDER}
    Input Text    @{CART_PAYMENT_NAMEONCARD}    Test Automation Payment
    Input Text    @{CART_PAYMENT_CARDNUMBER}    1234567890123456
    Input Text    @{CART_PAYMENT_CVC}    101
    Input Text    @{CART_PAYMENT_MONTH}    05
    Input Text    @{CART_PAYMENT_YEAR}    2030
    Click Element    @{CART_PAYMENT_BUTTONPAYANDCONFIRMORDER}
    Get Text    @{CART_PAYMENT_VERIVIEDORDERPLACED}
    Click Element    @{CART_BUTTON_DELETEACCOUNT}
    Get Text    @{CART_TEXT_ACCOUNTDELETED}

Place Order: Register before Checkout
    Click Element    @{HOME_BUTTON_SIGNUP/LOGIN}
    Input Text    @{CART_INPUT_USERNAME}    Ibnukemaltesting
    Input Text    @{CART_INPUT_EMAIL}    ibnukemaltesting@testmail.com
    Click Element    @{CART_BUTTON_SIGNUP}
    Get Text    @{CART_TEXT_REGISTERPAGE}
    Click Element    @{CART_SIGNUP_SELECTGENDER}
    Input Text    @{CART_SIGNUP_PASSWORD}    Ibnu.testing0
    Select From List By Value    @{CART_SIGNUP_DATE}    5
    Select From List By Value    @{CART_SIGNUP_MONTH}    4
    Select From List By Value    @{CART_SIGNUP_YEAR}    2001
    Input Text    @{CART_SIGNUP_INPUTFIRSTNAME}    Automation
    Input Text    @{CART_SIGNUP_INPUTLASTNAME}    Testing0
    Input Text    @{CART_SIGNUP_INPUTADDRESS}    Testing Address
    Select From List By Index    @{CART_SIGNUP_SELECTCOUNTRY}    2
    Input Text    @{CART_SIGNUP_INPUTSTATE}    Test
    Input Text    @{CART_SIGNUP_INPUTCITY}    Test
    Input Text    @{CART_SIGNUP_INPUTZIPCODE}    12345
    Input Text    @{CART_SIGNUP_INPUTMOBILENUMBER}    081111111
    Click Element    @{CART_SIGNUP_CLICKCREATEACCOUNT}
    Get Text    @{CART_SIGNUP_VERIFIEDACCOUNTCREATED}
    Click Element     @{CART_SIGNUP_BUTTONCONTINUE}
    Get Text    @{CART_SIGNUP_VERIFIEDLOGGEDIN}
    Click Element    @{HOME_BUTTON_CART}
    Get Text        @{CART_VERIFYTEXT_SHOPPINGCART1}
    Click Element    @{CART_LINK_CLICKHERE}
    Click Element    @{CART_BUTTON_ADDTOCART}
    Get Text    @{CART_TEXT_ADDED}
    Click Element    @{CART_BUTTON_VIEWCART}
    Get Text    @{CART_TEXT_SHOPPINGCART2}
    Click Element    @{CART_BUTTON_PROCCEEDTOCHECKOUT}
    Get Text    @{CART_CHECKOUT_VERIFYTEXTREVIEWYOURORDER}
    Input Text    @{CART_CHECKOUT_INPUTCOMMENTFIELD}    Test Checkout
    Click Element      @{CART_CHECKOUT_BUTTONPLACEORDER}
    Input Text    @{CART_PAYMENT_NAMEONCARD}    Test Automation Payment
    Input Text    @{CART_PAYMENT_CARDNUMBER}    1234567890123456
    Input Text    @{CART_PAYMENT_CVC}    101
    Input Text    @{CART_PAYMENT_MONTH}    05
    Input Text    @{CART_PAYMENT_YEAR}    2030
    Click Element    @{CART_PAYMENT_BUTTONPAYANDCONFIRMORDER}
    Get Text    @{CART_PAYMENT_VERIVIEDORDERPLACED}
    Click Element    @{CART_BUTTON_DELETEACCOUNT}
    Get Text    @{CART_TEXT_ACCOUNTDELETED}

Place Order: Login before Checkout
    Click Element    @{HOME_BUTTON_SIGNUP/LOGIN}
    Input Text    @{HOME_LOGIN_INPUTEMAIL}    ibnukemal09@testmail.com    
    Input Text    @{HOME_LOGIN_INPUTPASSWORD}    Ibnukemal09.
    Click Element    @{HOME_LOGIN_BUTTONLOGIN}
    Get Text    @{HOME_LOGIN_VERIVIEDLOGGEDIN}
    Click Element    @{HOME_BUTTON_CART}
    Get Text        @{CART_VERIFYTEXT_SHOPPINGCART1}
    Click Element    @{CART_LINK_CLICKHERE}
    Click Element    @{CART_BUTTON_ADDTOCART}
    Get Text    @{CART_TEXT_ADDED}
    Click Element    @{CART_BUTTON_VIEWCART}
    Get Text    @{CART_TEXT_SHOPPINGCART2}
    Click Element    @{CART_BUTTON_PROCCEEDTOCHECKOUT}
    Get Text    @{CART_CHECKOUT_VERIFYTEXTREVIEWYOURORDER}
    Input Text    @{CART_CHECKOUT_INPUTCOMMENTFIELD}    Test Checkout
    Click Element      @{CART_CHECKOUT_BUTTONPLACEORDER}
    Input Text    @{CART_PAYMENT_NAMEONCARD}    Test Automation Payment
    Input Text    @{CART_PAYMENT_CARDNUMBER}    1234567890123456
    Input Text    @{CART_PAYMENT_CVC}    101
    Input Text    @{CART_PAYMENT_MONTH}    05
    Input Text    @{CART_PAYMENT_YEAR}    2030
    Click Element    @{CART_PAYMENT_BUTTONPAYANDCONFIRMORDER}
    Get Text    @{CART_PAYMENT_VERIVIEDORDERPLACED}
    Click Element    @{CART_BUTTON_DELETEACCOUNT}
    Get Text    @{CART_TEXT_ACCOUNTDELETED}

Remove Products From Cart
    Click Element    @{HOME_BUTTON_CART}
    Get Text        @{CART_VERIFYTEXT_SHOPPINGCART1}
    Click Element    @{CART_LINK_CLICKHERE}
    Click Element    @{CART_BUTTON_ADDTOCART}
    Get Text    @{CART_TEXT_ADDED}
    Click Element    @{CART_BUTTON_VIEWCART}
    Get Text    @{CART_TEXT_SHOPPINGCART2}
    Click Element    @{CART_ICON_X}
    Get Text    @{CART_VERIFY_DELETEDITEMS}
    