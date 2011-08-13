class User < ActiveRecord::Base
  acts_as_authentic
  mount_uploader :avatar, AvatarUploader
  belongs_to :role
  
  has_many :orders
  
  scope :waiters, joins(:role).where(:roles => {:name => 'waiter'})
  
  def count_tables
    Table.where(:user_id => id).count
  end
end