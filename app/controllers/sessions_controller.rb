class SessionsController < ApplicationController
  def index
    
  end
  
  def new
    @session = Session.new
  end
  
  def create
    @session = Session.new(params[:session])
    @session.save
    flash[:notice] = "Session has been created."
    redirect_to @session
  end
  
  def show
    @session = Session.find(params[:id])
  end
end
