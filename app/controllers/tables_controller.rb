class TablesController < ApplicationController
  def index
    @tables = Table.all
    @waiters = User.waiters
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tables }
    end
  end

  def update
    table = Table.find(params[:table_id])
    waiter = User.find(params[:waiter_id]) if params[:waiter_id]
    table.user = waiter
    table.save

    respond_to do |format|
      if waiter
        hash = {
          :table => table,
          :waiter => {
            :id => waiter.id,
            :username => waiter.username,
            :avatar => waiter.avatar,
            :first_name => waiter.first_name,
            :last_name => waiter.last_name
            }
          }
        else
        hash = {:table => table}
        end
      format.json { render json: hash}
    end
  end
end
