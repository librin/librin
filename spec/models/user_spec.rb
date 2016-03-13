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
    
    it "fails if not unique" do
      user = User.create email:"test@test.com", password:'12345678', group_id:1, userName: "Pablo"
      user2 = User.create email:"test2@test.com", password:'12345678', group_id:1, userName: "Pablo"
      expect(user2.errors[:userName]).to have_at_least(1).items
    end
  end
  
  describe "Validation of email" do
    it "go well" do
      user = User.create email:"test@test.com", password:'12345678',userName:"Pablo", group_id:1
      expect(user.errors[:email]).to be_empty
    end
    
    it "fails if empty" do
      user = User.create password:'12345678', group_id:1, userName:"Pablo"
      expect(user.errors[:email]).to have_at_least(1).items
    end
    
    it "fails if not unique" do
      user = User.create email:"test@test.com", password:'12345678', group_id:1, userName: "Pablo"
      user2 = User.create email:"test@test.com", password:'12345678', group_id:1, userName: "user"
      expect(user2.errors[:email]).to have_at_least(1).items
    end
  end
  
  describe "Validation of password" do
    it "go well" do
      user = User.create email:"test@test.com", password:'12345678',userName:"Pablo", group_id:1
      expect(user.errors[:password]).to be_empty
    end
    
    it "fails if empty" do
      user = User.create email:"test@test.com" ,userName:"Pablo", group_id:1
      expect(user.errors[:password]).to have_at_least(1).items
    end
    
    it "fails if less than 8 characters" do
      user = User.create email:"test@test.com", password:'1234567', group_id:1, userName: "Pablo"
      expect(user.errors[:password]).to have_at_least(1).items
    end
  end
end
