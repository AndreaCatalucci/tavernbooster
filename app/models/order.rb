class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :table
  has_many :course_orders
  has_many :courses, :through => :course_orders
  
  scope :unpaid, where(:paid => false)
  scope :paid, where(:paid => true)
  
  def course_list
    course_orders.all.inject([]) do |arr, course_order|
      course = course_order.course
      number_cooked = course_order.number_cooked
      unit_price = course.price
      total_price = unit_price * number_cooked
      arr << {name: course.name, unit_price: unit_price, quantity: number_cooked, total_price: total_price}
    end
  end
  
  def total_price
    course_orders.inject(0) do |acc, co|
      acc += co.course.price * co.number_required
    end
  end

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
