class CourseOrder < ActiveRecord::Base
  belongs_to :order
  belongs_to :course
  
  scope :pending, where("number_required > number_cooked")
end
