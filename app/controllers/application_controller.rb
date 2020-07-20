class ApplicationController < ActionController::Base
	before_action :authenticate_user!,except: [:top] #ログインしていなければログイン画面へリダイレクト

	before_action :configure_permitted_parameters, if: :devise_controller?

 def after_sign_in_path_for(resource)
     users_index_path # ログイン後に遷移するpathを設定
  	end
  	
 def top
 end

 def edit
 @user = User.find(params[:id])
 end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end



end
