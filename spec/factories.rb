FactoryGirl.define do
  factory :user do
    first_name 'first'
    last_name 'last'
    city 'Anytown'
    postal_code 'M1A 2B3'
    email 'user@example.com'
    password 'foobar'
    password_confirmation 'foobar'
    instrument_list ['InstrumentA','InstrumentB']
    genre_list ['InstrumentA','InstrumentB']
  end
end