class CourseOrder < ActiveRecord::Base
  belongs_to :order
  belongs_to :course
end
