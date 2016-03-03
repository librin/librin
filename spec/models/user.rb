require 'rspec-rails'

describe User do
  it "has a valid factory" do
        Factory.create(:contact).should be_valid
  end
  it "is invalid without a firstname"
  it "is invalid without a lastname"
  it "returns a contact's full name as a string"
end