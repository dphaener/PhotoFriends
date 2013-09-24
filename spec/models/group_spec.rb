require 'spec_helper'

describe Group do
  let(:valid_attributes) { { owner: "1", name: "MyGroup", password: "abc123", password_confirmation: "abc123" } }
  
  context 'passwords do not match' do
    it 'fails validation' do
      group = Group.new(owner: "1", name: "MyGroup", password: "abc123", password_confirmation: "abc246")
      expect(group.save).to be(false)
    end
  end
  
  describe "#authenticate" do
    context 'groupname or does not exist' do
      it 'does not attempt to authenticate' do
        group = Group.create! valid_attributes
        expect(Group.authenticate("yomama@g.com", "abc123")).to be(nil)
      end
    end
    
    context 'groupname exists' do
      it 'authenticates using the groupname' do
        group = Group.create! valid_attributes
        expect(Group.authenticate("MyGroup", "abc123")).to eq(group)
      end
    end
  end
  
  describe "#encrypt_password" do
  
    context "password exists" do
      it "creates a pass hash and salt" do
        group = Group.new valid_attributes 
        group.encrypt_password
        expect(group.password_hash).not_to be(nil)
        expect(group.password_salt).not_to be(nil)
      end
    end
    
    context "password does not exist" do
      it "does nothing" do
        group = Group.new(name: "MyGroup")
        group.encrypt_password
        expect(group.password_hash).to be(nil)
        expect(group.password_salt).to be(nil)
      end
    end
  end
end
