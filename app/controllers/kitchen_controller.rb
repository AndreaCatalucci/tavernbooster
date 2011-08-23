class KitchenController < ApplicationController
  def index
	  @courses = Course.needed
	end
end
