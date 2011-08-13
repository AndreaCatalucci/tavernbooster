class Table < ActiveRecord::Base
  belongs_to :user
  has_many :orders
  
  scope :free, where('id not in (SELECT table_id from orders)')
end
