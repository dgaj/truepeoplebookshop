require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
  	# Make GET request to the signup path
    get signup_path
    # Make sure there is no difference in the user count between start of this block and when:
    assert_no_difference 'User.count' do
    	# Submit signup form with the following information
      post users_path, user: { name:  "",
                               email: "user@invalid",
                               password:              "foo",
                               password_confirmation: "bar" }
    end
    # Make sure the view is still at the signup form
    assert_template 'users/new'
  end

  test "valid signup information" do
    # Make GET request to the signup path
    get signup_path
    # Make sure there is a difference of 1 in the user count between start of this block and when:    
    assert_difference 'User.count', 1 do
    	# Submit signup form with the following information and follow the resulting redirect      
      post_via_redirect users_path, user: { name:  "Example User",
                                            email: "user@example.com",
                                            password:              "password",
                                            password_confirmation: "password" }
    end
    # Make sure the redirect led to the new users profile    
    assert_template 'users/show'
    # Make sure user has a status of logged in
    assert is_logged_in?
  end



end
