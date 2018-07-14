# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'securerandom'
require 'date'

def possible_purposes
  (1..17).to_a
end

def random_purposes
  used_purposes_count = possible_purposes.sample
  # 9 is always allowed for debugging purposes
  purposes = used_purposes_count.times.map { possible_purposes.sample }.uniq.sort + [9]
end

def random_purpose_string
  "{\"allowed_purposes\": #{random_purposes}}"
end

def random_user(n)
  name = Faker::BojackHorseman.character
  email = "#{name.gsub(' ', '')}#{n}@tu-berlin.de"
  password = SecureRandom.alphanumeric(20)
  date_of_birth = Faker::Date.birthday(18, 103)

  gender = Faker::Gender.type
  phone_number = Faker::PhoneNumber.cell_phone

  User.new(
    name: name,
    name_aip: random_purpose_string,
    email: email,
    email_aip: random_purpose_string,
    password: password,
    password_confirmation: password,
    date_of_birth: date_of_birth,
    date_of_birth_aip: random_purpose_string,
    gender: gender,
    gender_aip: random_purpose_string,
    phone_number: phone_number,
    phone_number_aip: random_purpose_string,
    heart_rate_logs_aip: random_purpose_string,
    step_day_logs_aip: random_purpose_string
  )
end

def random_heart_rate_measurement(date)
  time = Faker::Time.between(date - 1, date)
  heart_rate = rand(80..240)
  { timestamp: time, heart_rate: heart_rate }
end

def random_heart_rate(user_id)
  date = Faker::Date.between(5.years.ago, Date.today)
  measurements = (1..100).collect { random_heart_rate_measurement(date) }
  measurements.sort! { |a, b| a[:timestamp] <=> b[:timestamp] }
  HeartRateLog.new(
    heart_rate: measurements.to_json,
    date: date,
    user_id: user_id
  )
end

def random_step_log(user_id)
  StepDayLog.new(
    step_count: rand(2_500..45_000),
    date: Faker::Date.between(5.years.ago, Date.today),
    user_id: user_id
  )
end

10_000.times do |i|
  puts i
  user = random_user(i)
  if user.save
    100.times do
      random_step_log(user.id).save
    end
    100.times do
      random_heart_rate(user.id).save
    end
  end
end
