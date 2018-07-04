require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      name: 'George Washington',
      email: 'first@president.gov',
      password: 'some_password',
      password_confirmation: 'some_password'
    )
  end

  test 'user is valid' do
    assert @user.valid?
  end

  test 'name must be present' do
    @user.name = ' '
    assert_not @user.valid?
  end

  test 'rejects nonsensical email addresses' do
    ['tpei', '@tpei', 'tpei@.com', 'tpeinot.com', ' ', ''].each do |addr|
      @user.email = addr
      assert_not @user.valid?, "#{addr.inspect} should not be valid"
    end
  end

  test 'accepts valid emails' do
    ['tpei@tpei.com', 'AG-mb@swag.de', '1234t@gmx.net'].each do |addr|
      @user.email = addr
      assert @user.valid?, "#{addr.inspect} should be valid"
    end
  end

  test 'email is unique and case_insensitive' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'email address is saved as lower-case' do
    mixed_case = 'SwAg@YoLo.COM'
    @user.email = mixed_case
    @user.save
    assert_equal mixed_case.downcase, @user.reload.email
  end

  test 'password is present' do
    @user.password = '          '
    assert_not @user.valid?
  end

  test 'password is not empty' do
    @user.password = ''
    @user.password_confirmation = ''
    assert_not @user.valid?
  end

  test 'password is of minimum length' do
    @user.password = '1234567'
    assert_not @user.valid?
  end
end
