require 'spec_helper'

describe SessionsController do
  it "displays an error for a mission session" do
    get :show, :id => "not-here"
    response.should redirect_to(sessions_path)
    message = "The session you were looking for could not be found."
    flash[:alert].should eql(message)
  end
end
