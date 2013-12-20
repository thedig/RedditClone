# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  user_name       :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :password, :session_token, :user_name
  attr_reader :password

  has_many :links
  has_many :moderated_subs, :class_name => "Sub", :foreign_key => :user_id

  validates :user_name, :password, :presence => true
  validates :password, :length => { :minimum => 6 }

  before_validation :reset_session_token

  def self.find_by_credentials(user_name, password)
    @user = User.find_by_user_name(user_name)
    return @user if @user && @user.is_password?(password)
    nil
  end

  def self.generate_token
    SecureRandom.urlsafe_base64
  end

  def password=(pt)
    @password = pt
    self.password_digest = BCrypt::Password.create(@password)
  end

  def is_password?(plaintext)
    BCrypt::Password.new(self.password_digest).is_password?(plaintext)
  end

  def reset_session_token
    self.session_token = User.generate_token
  end
end
