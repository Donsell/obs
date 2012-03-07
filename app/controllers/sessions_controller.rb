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
  
end
