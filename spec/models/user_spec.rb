require 'rails_helper'

describe User do
  before do
    @user = User.new(first_name: "Example", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

    subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:crypted_password) }
  it { should respond_to (:salt)}
  it { should respond_to(:city) }
  it { should respond_to(:postal_code) }
  it { should respond_to(:bio) }
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:remember_me_token) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:longitude) }
  it { should respond_to(:latitude) }
  it { should respond_to(:looking_for) }
  it { should respond_to(:personal_url) }

  it { should be_valid}

end