require 'test_helper'

class UserTest < ActiveSupport::TestCase

 def setup
   @user = User.new(name: "Example User", email: "example@example.coms",
                    password: "foobar", password_confirmation: "foobar")
 end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "   "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "   "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should reject invalid addressses" do
    invalid_addressess = %w[user@example,com user_at_foo.org user.name@example.foobar@baz_bar foo@bar+baz.com foo@bar..com]
    invalid_addressess.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
      end
  end

  test "email validation should accept valid addressses" do
    valid_addressess = %w[user@example.com USER@foo.COM A_US-ER@FOO.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addressess.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
      end
  end

  test "email addresses should be unique" do
    duplicate_user=@user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lowercase" do
    mixed_case_email = "ExAmPLE@EXamPLE.cOM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " *6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

end
