# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  user_name       :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'spec_helper'

describe User do
  let(:unnamed_user) { User.new }

  it "validates presence of user name" do
    expect(unnamed_user).to have(1).error_on(:user_name)
  end

  it "validates presence of password" do
    expect(unnamed_user).to have_at_least(1).error_on(:password)
  end

  let(:short_password_user) { b = User.new(:password => "abc") }

  it "validates password length > 5" do
    expect(short_password_user).to have_at_least(1).error_on(:password)
  end

  context "association tests" do
    it { should have_many(:links) }
    it { should have_many(:moderated_subs) }
  end

  let(:complete_user) { c = User.new(:user_name => "steve", :password => "lololol")}

  it "lets you mass assign user_name and password" do
    expect(complete_user).to have(0).errors
  end

  context "doesn't store password" do
    before(:all) do
      complete_user.session_token = "123"
      complete_user.save!
    end

    it "doesn't store password" do
      User.find(1).password.should be_nil
    end
  end

  let(:credential_user) { FactoryGirl.build(:user) }

  context "finds by credentials" do
    before(:all) do
      credential_user.save!
    end
    it "adsfa" do
      expect(credential_user).to eq(User.find_by_credentials(
      credential_user.user_name, "password"))
    end
  end


end
