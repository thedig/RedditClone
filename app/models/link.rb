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
#

class Link < ActiveRecord::Base
  attr_accessible :body, :title, :url, :user_id, :sub_id

  belongs_to :user
  has_many :link_subs
  has_many :subs, :through => :link_subs, :source => :sub
  has_many :comments

  has_many :user_votes

  validates :url, :title, :body, :user_id, :presence => true

  def connect_to_sub(sub_id)
    link_sub = LinkSub.new(:sub_id => sub_id, :link_id => self.id)
    link_sub.save!
  end

  def top_level_comments
    comments.where('parent_id IS NULL').all
  end

end
