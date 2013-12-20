class LinkSub < ActiveRecord::Base
  attr_accessible :sub_id, :link_id
  validates :sub_id, :link_id, :presence => true

  belongs_to :link
  belongs_to :sub
end
