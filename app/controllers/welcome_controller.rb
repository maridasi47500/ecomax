class WelcomeController < ApplicationController
def page
end
  def index
if !params[:dpt]
redirect_to welcome_index_path(dpt: 'GF')
else
render :index
end
  end
end
