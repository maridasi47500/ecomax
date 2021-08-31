class UserconnexionController < ApplicationController
def destroy
if user_signed_in?
sign_out current_user
end
redirect_to root_path(dpt: params[:dpt])
end
def new
render template: "users/sessions/new", layout: false
end
end
