class UserinscriptionController < ApplicationController
protect_from_forgery except: [:email]
def email
render json: User.find_by(email: params[:email]) != nil
end
def new
render template: "users/registrations/new", layout: false
end
def create
@user=User.new(user_params)
if @user.save
bypass_sign_in(@user)
redirect_to root_path(dpt: params[:dpt])
end
rescue
redirect_to root_path(dpt: params[:dpt]), notice: "Une erreur est survenue. Réessayez."

end
private
def user_params
params.require(:user).permit(:firstname,:lastname,:email,:password,:password_confirmation)
end

end
