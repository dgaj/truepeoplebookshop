require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:matthew)
  end

  test "login with invalid information" do
    # Make GET request to the login path  	
    get login_path
    # Make sure the view is at the login form    
    assert_template 'sessions/new'
    # Attempt login with invalid parameters 
    post login_path, session: { email: "", password: "" }
    # Make sure the view is still at the login form
    assert_template 'sessions/new'
    # Make sure flash error message is present
    assert_not flash.empty?
    # Make GET request to the root path     
    get root_path
    # Make sure flash error message not present    
    assert flash.empty?
  end

  test "login with valid information followed by logout" do
    # Make GET request to the login path   	
    get login_path
    # Make sure the view is at the login form    
    assert_template 'sessions/new'
    # Attempt login with valid parameters    
    post login_path, session: { email: @user.email, password: 'password' }
    # Make sure user has a status of logged in
    assert is_logged_in?    
    # Make sure successful login redirects to the users profile 
    assert_redirected_to @user
    # Follow the redirect to the users profile
    follow_redirect!
    # Make sure the view is at the users profile    
    assert_template 'users/show'
    # Make sure the view displays 0 login links
    assert_select "a[href=?]", login_path, count: 0
    # Make sure the view displays 1 logout link
    assert_select "a[href=?]", logout_path
    # Make sure the view displays 1 link to the users profile
    assert_select "a[href=?]", user_path(@user)
    # Make DELETE request to the logout path     
    delete logout_path
    # Make sure user does not have a status of logged in     
    assert_not is_logged_in?
    # Make sure user is redirected to the home page
    assert_redirected_to root_url
    # Simulate a user clicking logout in a second window
    delete logout_path    
    # Follow the redirect to the home page
    follow_redirect!
    # Make sure the view displays 1 login link    
    assert_select "a[href=?]", login_path
    # Make sure the view displays 0 logout links    
    assert_select "a[href=?]", logout_path,      count: 0
    # Make sure the view displays 0 links to the users profile    
    assert_select "a[href=?]", user_path(@user), count: 0    
  end

  test "login with remembering" do
  	# Login as the test user with the remember me box checked
    log_in_as(@user, remember_me: '1')
    # Make sure the cookies remember_token is not nil
    assert_not_nil cookies['remember_token']
  end

  test "login without remembering" do
  	# Login as the test user with the remember me box not checked
    log_in_as(@user, remember_me: '0')
    # Make sure the cookies remember_token is nil
    assert_nil cookies['remember_token']
  end








end
