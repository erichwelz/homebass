require 'rails_helper'

describe Invitation do
  before do
    @user = FactoryGirl.build(:user)
    @invitation = @user.invitations.build(content: 'Content',
                                          user_id: 1,
                                          recipient_id: 2)
  end

  subject { @invitation }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:recipient_id) }
  it { should respond_to(:user) }
  it { should respond_to(:read) }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @invitation.user_id = nil }
    it { should_not be_valid }
  end

  describe "when recipient_id is not present" do
    before { @invitation.recipient_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @invitation.content = " " }
    it { should_not be_valid }
  end
end