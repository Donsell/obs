class ObservationsController < ApplicationController
  before_filter :find_session
  before_filter :find_observation, :only => [:show, :edit, :update, :destory]
  
  def new
    @observation = @session.observations.build
  end
  
  def create
    @observation = @session.observations.build(params[:observation])
    if @observation.save
      flash[:notice] = "Observation has been created."
      redirect_to [@session, @observation]
    else
      flash[:alert] = "Observation as not been created."
      render :action => "new"
    end
  end
  
  def show
    
  end
  
private
  def find_session
    @session = Session.find(params[:session_id])
  end
  
  def find_observation
    @observation = @session.observations.find(params[:id])
  end
end
