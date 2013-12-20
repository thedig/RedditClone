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

class Sub < ActiveRecord::Base
  attr_accessible :name, :user_id

  validates :name, :user_id, :presence => true
  validates :name, :uniqueness => true

  belongs_to :moderator, :class_name => "User", :foreign_key => :user_id
  has_many :link_subs
  has_many :links, :through => :link_subs, :source => :link

  def make_link(link_hash)
    link = Link.new(link_hash)
    link.save!

    link_sub = LinkSub.new(:sub_id => self.id, :link_id => link.id)
    link_sub.save!
  end

end
