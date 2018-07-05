require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      name: 'George Washington',
      email: 'first@president.gov',
      password: 'some_password',
      password_confirmation: 'some_password',
      date_of_birth: Date.new(1732, 2, 22),
      gender: 'male'
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

  test 'can create and access StepDayLogs' do
    @user.save
    @user.step_day_logs.create(step_count: 9578, date: Date.yesterday)
    @user.step_day_logs.create(step_count: 10_556, date: Date.today)

    assert_equal 2, @user.step_day_logs.count
    assert_equal 10_556,
      @user.step_day_logs.find_by(date: Date.today).step_count
  end

  test 'can create and access HeartRateLogs' do
    @user.save
    @user.heart_rate_logs.create(
      heart_rate: { some: 'json' }.to_json, date: Date.yesterday
    )
    @user.heart_rate_logs.create(
      heart_rate: { more: 'json!' }.to_json, date: Date.today
    )

    assert_equal 2, @user.heart_rate_logs.count
    assert_equal ({ some: 'json' }.to_json),
      @user.heart_rate_logs.find_by(date: Date.yesterday).heart_rate
  end

  test 'as_json return appropriate data' do
    @user.save
    @user.heart_rate_logs.create(heart_rate: { some: 'json' }.to_json, date: Date.today)
    @user.step_day_logs.create(step_count: 1234, date: Date.yesterday)
    @user.step_day_logs.create(step_count: 9999, date: Date.today)

    assert_equal ({
      name: @user.name,
      email: @user.email,
      date_of_birth: @user.date_of_birth,
      gender: @user.gender,
      phone_number: nil,
      steps: @user.step_day_logs.as_json,
      heart_rate: @user.heart_rate_logs.as_json,
    }), @user.as_json
  end
end
