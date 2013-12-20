# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :string(255)      not null
#  link_id    :integer          not null
#  parent_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ActiveRecord::Base
  attr_accessible :link_id, :body, :parent_id
  validates :link_id, :body, :presence => true

  belongs_to :link
  belongs_to(:parent,
             :class_name => "Comment",
             :foreign_key => :parent_id
             )

  has_many :children, :class_name => "Comment", :foreign_key => :parent_id

end
