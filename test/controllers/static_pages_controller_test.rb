require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  
  test "should get home" do
    # Make GET request to the home page
    get :home
    # Make sure that the response is a 200 success                                  
    assert_response :success 
    # Make sure the title tag says "Home - template"                 
    assert_select "title", "Home - template"
  end

  test "should get help" do
    # Make GET request to the help page
    get :help
    # Make sure that the response is a 200 success      
    assert_response :success
    # Make sure the title tag says "Help - template"     
    assert_select "title", "Help - template"
  end

  test "should get about" do
    # Make GET request to the about page
    get :about
    # Make sure that the response is a 200 success      
    assert_response :success
    # Make sure the title tag says "About - template"     
    assert_select "title", "About - template"
  end

  test "should get contact" do
    # Make GET request to the contact page
    get :contact
    # Make sure that the response is a 200 success      
    assert_response :success
    # Make sure the title tag says "Contact - template"     
    assert_select "title", "Contact - template"
  end

end
