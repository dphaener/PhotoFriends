require 'spec_helper'

describe User do
  
  context 'without an email address' do
    it 'fails validation' do
      expect(User.new).to have(1).error_on(:email)
    end
  end
  
  context 'email is not unique' do
    it 'fails validation' do
      user = User.create!(email: "me@stuff.com", password: "abc123")
      expect(User.new email: "me@stuff.com").to have(1).error_on(:email)
    end
  end
  
  context 'passwords do not match' do
    it 'fails validation' do
      user = User.new(email: "me@stuff.com", password: "abc123", password_confirmation: "abc246")
      expect(user.save).to be(false)
    end
  end
  
  describe "#authenticate" do
    context 'username or email does not exist' do
      it 'does not attempt to authenticate' do
        user = User.create!(email: "me@stuff.com", password: "abc123")
        expect(User.authenticate("yomama@g.com", "abc123")).to be(nil)
      end
    end
    
    context 'username does not exist but email does' do
      it 'authenticates using the email' do
        user = User.create!(email: "me@stuff.com", password: "abc123")
        expect(User.authenticate("me@stuff.com", "abc123")).to eq(user)
      end
    end
    
    context 'username exists' do
      it 'authenticates using the username' do
        user = User.create!(email: "me@stuff.com", password: "abc123", username: "bob")
        expect(User.authenticate("bob", "abc123")).to eq(user)
      end
    end
  end
  
  describe "#encrypt_password" do
  
    context "password exists" do
      it "creates a pass hash and salt, and sets the default user level to 5" do
        user = User.new(email: "me@stuff.com", password: "abc123", username: "bob") 
        user.encrypt_password
        expect(user.userlevel).to eq 5
        expect(user.password_hash).not_to be(nil)
        expect(user.password_salt).not_to be(nil)
      end
    end
    
    context "password does not exist" do
      it "does nothing" do
        user = User.new(email: "me@stuff.com", username: "bob")
        user.encrypt_password
        expect(user.userlevel).not_to eq 5
        expect(user.password_hash).to be(nil)
        expect(user.password_salt).to be(nil)
      end
    end
  end
    
end
