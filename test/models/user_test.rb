require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
  	# Create a user to run the tests on
    @user = User.new(	name: "Example User", email: "user@example.com", password: "password",
    									password_confirmation: "password")
  end

  test "should be valid" do
  	# Make sure the user created in setup is valid
    assert @user.valid?
  end

  test "name should be present" do
  	# Set the user name to blank spaces
    @user.name = "     "
    # Make sure the user is not valid
    assert_not @user.valid?
  end

  test "email should be present" do
  	# Set the user email to blank spaces
    @user.email = "     "
    # Make sure the user is not valid    
    assert_not @user.valid?
  end

  test "name should not be too long" do
  	# Set the user name to 51 characters
    @user.name = "a" * 51
    # Make sure the user is not valid     
    assert_not @user.valid?
  end

  test "email should not be too long" do
  	# Set the user name to 256 characters  	
    @user.email = "a" * 244 + "@example.com"
    # Make sure the user is not valid     
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
  	# Create an array of valid email address formats
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    # Loop through each valid email address in the array                     
    valid_addresses.each do |valid_address|
    	# Set the users email to the loops current valid email address
      @user.email = valid_address
      # Make sure the user is valid with the loops current valid email address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
  	# Create an array of invalid email address formats
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    # Loop through each invalid email address in the array                       
    invalid_addresses.each do |invalid_address|
    	# Set the users email to the loops current invalid email address
      @user.email = invalid_address
      # Make sure the user is not valid with the loops current invalid email address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
  	# Duplicate the user created at setup
    duplicate_user = @user.dup
    # Change the duplicate users email to all uppercase
    duplicate_user.email = @user.email.upcase
    # Attempt to save the user
    @user.save
    # Make sure the user is not valid
    assert_not duplicate_user.valid?
  end

  test "password should be present (nonblank)" do
  	# Change users password and confirmation to 6 blank spaces
    @user.password = @user.password_confirmation = " " * 6
    # Make sure the user is not valid    
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
  	# Change users password and confirmation to 5 characters
    @user.password = @user.password_confirmation = "a" * 5
    # Make sure the user is not valid     
    assert_not @user.valid?
  end

end