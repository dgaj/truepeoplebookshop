require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "should get new" do
  	# Make GET request to app/views/users/new.html.erb
    get :new
    # Make sure that the response is a 200 success       
    assert_response :success
  end
end