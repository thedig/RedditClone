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
