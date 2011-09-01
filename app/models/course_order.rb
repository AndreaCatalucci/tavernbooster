class CourseOrder < ActiveRecord::Base
  belongs_to :order
  belongs_to :course

  scope :pending, where("number_required > number_cooked")

  def number_needed
    number_required - number_cooked
  end

  def increase_number_cooked_by(byval)
    new_val = number_cooked + byval
    sql = "UPDATE course_orders SET number_cooked = #{new_val} WHERE course_orders.course_id =
      #{course_id} AND course_orders.order_id = #{order_id}"
    connection.update(sql)
  end
end