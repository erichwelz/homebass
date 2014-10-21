FactoryGirl.define do
  factory :user do
    first_name 'user'
    sequence(:last_name) { |n| '##{n}' }
    sequence(:email) { |n| 'user_#{n}@example.com' }
    city 'Anytown'
    postal_code 'M1A 2B3'
    password 'foobar'
    password_confirmation 'foobar'
    instrument_list ['InstrumentA','InstrumentB']
    genre_list ['InstrumentA','InstrumentB']
   end
end