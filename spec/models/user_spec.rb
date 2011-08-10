require 'spec_helper'

describe User do
  it "should have an email and a password hash" do
    user = User.new
    user.password_hash.should == nil
    user.email = 'ba@wer.com'
    user.password = 'tedad'
    user.save.should == true
    user.password_hash.should_not == nil
  end

  it "should be able to authenticate an existing user" do
    email = 'baer@ouer.com'
    password = 'pouiewf'
    user = User.create(:email => email, :password => password)
    password_hash = user.password_hash
    
    authenticated = User.authenticate(email, password)
    authenticated.should_not == nil
    authenticated.email.should == email 
    authenticated.password_hash.should == password_hash 
  end
end
