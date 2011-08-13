class Course < ActiveRecord::Base
  has_many :course_orders
  has_many :orders, :through => :course_orders
  has_many :pending_orders, :through => :course_orders, :source => :order, :conditions => ['course_orders.number_required > course_orders.number_cooked']
  belongs_to :course_type
  mount_uploader :image, ImageUploader
  
  scope :needed, joins(:course_orders)
  
  def self.all_by_type
    CourseType.all.inject({}) do |result, type|
	    result[type.id] = Course.find_all_by_course_type_id(type.id)
	  end
  end
  
end
