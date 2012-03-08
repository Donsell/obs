class SessionsController < ApplicationController
  def index
    @sessions = Session.all 
  end
    
  def new
    @session = Session.new
  end
  
  def create
    @session = Session.new(params[:session])
    if @session.save
      flash[:notice] = "Session has been created."
      redirect_to @session
    else
      flash[:alert] = "Session has not been created."
      render :action => "new"
    end
  end
  
  def show
    @session = Session.find(params[:id])
  end
  
  def edit
    @session = Session.find(params[:id])
  end
  
  def update
    @session = Session.find(params[:id])
    if @session.update_attributes(params[:session])
      flash[:notice] = "Session has been updated."
      redirect_to @session
    else
      flash[:alert] = "Session has not been updated."
      render :action => "edit"
    end
  end
  
  def destroy
    @session = Session.find(params[:id])
    @session.destroy
    flash[:notice] = "Session has been deleted."
    redirect_to sessions_path
  end
  
end
