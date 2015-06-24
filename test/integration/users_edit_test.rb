require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:matthew)
  end

  test "unsuccessful edit" do
  	log_in_as(@user)
  	# Make GET request to the users edit view
    get edit_user_path(@user)
    # Make sure the view is the users edit 
    assert_template 'users/edit'
    # Make PATCH request with invalid credentials
    patch user_path(@user), user: { name:  "",
                                   email: "foo@invalid",
                                   password:              "foo",
                                   password_confirmation: "bar" }
    # Make sure the view is still the users edit                                
    assert_template 'users/edit'
  end

	test "successful edit with friendly forwarding" do
  	# Make GET request to the users edit view
    get edit_user_path(@user)
    # Login as user
    log_in_as(@user)
    # Make sure after login that user is redirected to the original destination
    assert_redirected_to edit_user_path(@user)
    # Set variable 'name' to "Foo Bar"
		name  = "Foo Bar"
		# Set variable 'email' to "foo@bar.com"
		email = "foo@bar.com"
		# Make PATCH request with valid credentials using the name and email variables
		patch user_path(@user), user: { name:  name,
		                               email: email,
		                               password:              "",
		                               password_confirmation: "" }

		assert_not flash.empty?
		assert_redirected_to @user
		@user.reload
		assert_equal name,  @user.name
		assert_equal email, @user.email
	end

end
