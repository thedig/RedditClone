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

require 'spec_helper'

describe Comment do
  pending "add some examples to (or delete) #{__FILE__}"
end
