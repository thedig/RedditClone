# == Schema Information
#
# Table name: user_votes
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  link_id    :integer          not null
#  is_up      :boolean          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserVote < ActiveRecord::Base
  attr_accessible :user_id, :link_id, :is_up

  validates :user_id, :link_id, :is_up, :presence => true

  belongs_to :link
  belongs_to :user

end
