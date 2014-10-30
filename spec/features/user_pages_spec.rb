require 'rails_helper'

describe "User pages" do

  subject { page }

  describe "index" do
    let(:user) { FactoryGirl.create(:user, password: 'foobar') }
    before(:each) do
      login_user('foobar')
      visit root_path
    end

    it { should_not have_content('Login') }
    it { should have_content('My Messages') }
  end

    describe "show" do
    let(:user) { FactoryGirl.create(:user, password: 'foobar') }
    before(:each) do
      login_user('foobar')
      visit user_path(user)
    end

    it { should have_content('Leave a Reference') }
  end

  describe "signup" do

    before { visit join_path }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button 'Save' }.not_to change(User, :count)
      end
    end

    describe "after submission" do
       before { click_button 'Save' }

      it { should have_content('We will never sell')}
      it { should have_content('errors')}
    end
  end
end