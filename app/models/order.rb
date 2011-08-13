class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :table
  has_many :course_orders
  has_many :courses, :through => :course_orders
  
  def formatted_courses
    result = {}
    found_courses = CourseOrder.includes(:course).find_all_by_order_id(id)
    CourseType.all.each do |course_type|
      result[course_type.id] = {}
      course_type.courses.each do |course|
        right_course = (found_courses.select { |c| c.course_id == course.id and c.course.course_type_id == course_type.id}).first
        quantity = right_course.try(:number_required) || 0
        result[course_type.id][course.id] = {:name => course.name, :quantity => quantity}
      end
    end
    
    logger.debug result.pretty_inspect
    result
  end
end
