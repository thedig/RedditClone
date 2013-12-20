# == Schema Information
#
# Table name: link_subs
#
#  id         :integer          not null, primary key
#  sub_id     :integer          not null
#  link_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class LinkSub < ActiveRecord::Base
  attr_accessible :sub_id, :link_id
  validates :sub_id, :link_id, :presence => true

  belongs_to :link
  belongs_to :sub
end
