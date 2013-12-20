# == Schema Information
#
# Table name: subs
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Sub do
  let(:empty_sub) { Sub.new }

  it "validates presence of sub name" do
    expect(empty_sub).to have(1).error_on(:name)
  end

  it "validates presence of moderator" do
    expect(empty_sub).to have_at_least(1).error_on(:user_id)
  end

  let(:sub_1) { Sub.new(:name => "funny", :user_id => 1) }
  let(:sub_2) { Sub.new(:name => "funny", :user_id => 2) }

  it "checks different names" do
    sub_1.save
    expect(sub_2).to have(1).error_on(:name)
  end

  context "association tests" do
    it { should belong_to(:moderator) }
    it { should have_many(:links) }
  end

end
