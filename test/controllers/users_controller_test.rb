require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
  	# Set the instance variable 'user' to the users.yml 'matthew' record
    @user = users(:matthew)
    # Set the instance variable 'other_user' to the users.yml 'misty' record	
    @other_user = users(:misty)
  end

  test "should redirect index when not logged in" do
    # Make GET request to the user index view
    get :index
    # Make sure that the user is redirected to the login page
    assert_redirected_to login_url
  end

  test "should get new" do
  	# Make GET request to the new user view
    get :new
    # Make sure that the response is a 200 success       
    assert_response :success
  end

  test "should redirect edit when not logged in" do
  	# Make GET request to the users edit view
    get :edit, id: @user
    # Make sure a flash message is displayed
    assert_not flash.empty?
    # Make sure there is a redirect to the login view
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
  	# Make a PATCH request with the users valid credentials
    patch :update, id: @user, user: { name: @user.name, email: @user.email }
    # Make sure a flash message is displayed 
    assert_not flash.empty?
    # Make sure there is a redirect to the login view
    assert_redirected_to login_url
  end

  test "should redirect edit when logged in as wrong user" do
    # Log in as misty
    log_in_as(@other_user)
    # Make GET request for matthews edit view
    get :edit, id: @user
    # Make sure a flash message is displayed 
    # assert_not flash.empty?
    # Make sure there is a redirect to the root view
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    # Log in as misty
    log_in_as(@other_user)
    # Make PATCH request for matthews edit view
    patch :update, id: @user, user: { name: @user.name, email: @user.email }
    # Make sure a flash message is displayed 
    # assert_not flash.empty?
    # Make sure there is a redirect to the root view
    assert_redirected_to root_url
  end

end