class KitchenController < ApplicationController
  def index
    @courses = Course.needed.group(:id).order('created_at')
  end
end
