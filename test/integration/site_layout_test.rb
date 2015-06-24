require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  test "layout links" do
    # Make GET request to the root path
    get root_path
    # Make sure the above GET request returns app/views/static_pages/home.html.erb
    assert_template 'static_pages/home'
    # Make sure there are two links to the root path available
    # One is on the site title on the header, the other is the link on the header navigation
    assert_select "a[href=?]", root_path, count: 2
    # Make sure there is one link to the help path available
    assert_select "a[href=?]", help_path
    # Make sure there is one link to the about path available
    assert_select "a[href=?]", about_path
    # Make sure there is one link to the contact path available
    # assert_select "a[href=?]", contact_path
  end

end
