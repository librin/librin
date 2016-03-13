require 'rails_helper'

RSpec.describe User, type: :model do
  #let(:user) {User.create email:"pablobuntu@gmail.com", password:'12345678',userName:"Pablo", group_id:1}
  describe "Validation of userName" do
    it "go well" do
      user = User.create email:"test@test.com", password:'12345678',userName:"Pablo", group_id:1
      expect(user.errors[:userName]).to be_empty
    end
    
    it "fails if empty" do
      user = User.create email:"test@test.com", password:'12345678', group_id:1
      expect(user.errors[:userName]).to have_at_least(1).items
    end
  end
end
