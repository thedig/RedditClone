# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  url        :string(255)      not null
#  body       :text             not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  sub_id     :integer          not null
#

require 'spec_helper'

describe Link do
  let(:empty_link) { Link.new }

  it "validates presence of title" do
    expect(empty_link).to have(1).error_on(:title)
  end

  it "validates presence of body" do
    expect(empty_link).to have(1).error_on(:body)
  end

  it "validates presence of url" do
    expect(empty_link).to have(1).error_on(:url)
  end

  it "validates presence of user_id" do
    expect(empty_link).to have(1).error_on(:user_id)
  end

  context "association tests" do
    it { should belong_to(:user) }
    it { should have_many(:subs) }
  end



  let(:complete_link) { Link.new(:url => "google.com",
                                 :title => "search engine",
                                 :body => "it's good",
                                 :user_id => 1)}

  it "lets you mass assign stuff" do
    expect(complete_link).to have(0).errors
  end
end
