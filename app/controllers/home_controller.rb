class HomeController < ApplicationController
  def index
    logger.debug current_user.try(:role).try(:name)
    case current_user.try(:role).try(:name)
    when nil
      redirect_to login_path
    when 'administrator'
      redirect_to :controller => 'admin', :action => 'index'
    when 'cashier'
      redirect_to :controller => 'checkout', :action => 'index'
    when 'cook'
      redirect_to :controller => 'kitchen', :action => 'index'
    when 'waiter'
      redirect_to :controller => 'waiter', :action => 'index'
    end
  end
end