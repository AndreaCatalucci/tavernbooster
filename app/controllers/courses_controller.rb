class CoursesController < ApplicationController

  #load and authorize with cancan
  #load_and_authorize_resource

  # GET /courses
  # GET /courses.json
  def index
    @courses_by_type = Hash.new
    @sorted_types = CourseType.all

    @sorted_types.each do |course_type|
    @courses_by_type[course_type] = Course.find_all_by_course_type_id(course_type.id)
  end
  logger.debug "ECCOLO"
  logger.debug @courses_by_type

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/new
  # GET /courses/new.json
  def new
    @course = Course.new
    @course_types = CourseType.all.map {|c| [c.name.capitalize, c.id]}

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
    @course_types = CourseType.all.map {|c| [c.name.capitalize, c.id]}
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(params[:course])

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render json: @course, status: :created, location: @course }
      else
        format.html { render action: "new" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :ok }
    end
  end
  
  def cook
    course_id = params[:course_id]
    order_id = params[:order_id]
    #CHECK THE PARAMS TO PREVENT INJECTION
    course_order = CourseOrder.find_by_course_id_and_order_id(course_id,order_id)
    course_order.increase_number_cooked_by(params[:number].to_i)
    course_order2 = CourseOrder.find_by_course_id_and_order_id(course_id,order_id)
    number_needed = course_order2.number_needed
    number_cooked = course_order2.number_cooked

    respond_to do |format|
      format.json { render json: {number_cooked: number_cooked, number_needed: number_needed} }
    end
  end
end