class KitchenController < ApplicationController
  def index
	  @courses = Course.needed.find(:all, :include => [:pending_orders, :orders], :order => 'created_at')
	end
end
