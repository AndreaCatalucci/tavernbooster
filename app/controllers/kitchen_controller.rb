class KitchenController < ApplicationController
  def index
    @courses = Course.needed.group(:id, :name).order('created_at')
  end
end
