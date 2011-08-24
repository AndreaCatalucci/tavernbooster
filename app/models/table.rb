class Table < ActiveRecord::Base
  belongs_to :user
  has_many :orders

  delegate :username, :first_name, :last_name, :to => :user, :prefix => true
  scope :free, where('id not in (SELECT table_id from orders)')
end
