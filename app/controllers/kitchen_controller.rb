class KitchenController < ApplicationController
  def index
    @courses = Course.needed.order('id, created_at')
  end
end
