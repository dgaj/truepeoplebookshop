require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:matthew)
  end

  test "index including pagination" do
  	# Log in as user
    log_in_as(@user)
    # Make GET request to user index view
    get users_path
    # Make sure the view is user index
    assert_template 'users/index'
    # Make sure there is a div with a class of 'pagination'
    assert_select 'ul.pagination', count: 2
    # Loop through each user on page 1 of the pagination
    User.paginate(page: 1).each do |user|
    	# For each user in the loop, make sure the user has name link to their profile
      #assert_select 'a[href=?]', user_path(user), text: user.name
    end
  end


end
