class UserSessionsController < ApplicationController

  # GET /user_sessions/new
  # GET /user_sessions/new.json
  def new
    @user_session = UserSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_session }
    end
  end

  # POST /user_sessions
  # POST /user_sessions.json
  def create
    @user_session = UserSession.new(params[:user_session])
    logger.debug "CI SONO"
    respond_to do |format|
      if @user_session.save
      logger.debug "saved #{pp @user_session}"
        format.html { redirect_to root_url, notice: 'Login eseguito correttamente' }
        format.json { render json: root_url, status: :created, location: @user_session }
      else
      logger.debug "not saved #{pp @user_session}"
        format.html { render action: "new" }
        format.json { render json: @user_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_sessions/1
  # DELETE /user_sessions/1.json
  def destroy
    @user_session = UserSession.find(params[:id])
    @user_session.destroy

    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Logout eseguito correttamente' }
      format.json { head :ok }
    end
  end
end
