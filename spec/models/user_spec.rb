require 'spec_helper'

describe User do

  before { @user = User.new(name: "Ho Chiu", email: "hochiu@gmail.com") }
  subject { @user }
  
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should be_valid }
  
  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end
  
  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end
  
  describe "when name is too long" do
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
  end
  
  describe "when email format is NOT valid" do
    it "should be invalid" do
      addresses = %w[user@foo,com usre_atfoo.org ab.cd@foo. foo@bar+barz.com]
      addresses.each do |bad_addr|
        @user.email = bad_addr
        expect(@user).not_to be_valid
      end
    end
  end
  
  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.com usre@foo.org ab.cd@foo.com ]
      addresses.each do |good_addr|
        @user.email = good_addr
        expect(@user).to be_valid
      end
    end
  end
  
  describe "when email address already taken" do
    before do
      same_email_user = @user.dup
      same_email_user.email = @user.email.upcase
      same_email_user.save
    end
    
    it { should_not be_valid }
  end
  
  describe "email address will be down-cased before saving" do
    before do
      @user.email = "HEYTHERE@GMAIL.COM"
      @user.save
    end
    
    it { should be_valid }
  end
end