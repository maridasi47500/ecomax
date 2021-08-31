class ApplicationController < ActionController::Base
before_action :dpt
def dpt
  if params[:dpt]
    session[:dpt] = params[:dpt]
  else
    params[:dpt] = session[:dpt]
  end
@monpays=Island.find_by_dpt(params[:dpt]).name.upcase


end
end
