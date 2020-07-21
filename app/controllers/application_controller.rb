class ApplicationController < ActionController::Base
	before_action :authenticate_user!,except: [:top] #ログインしていなければログイン画面へリダイレクト

	before_action :configure_permitted_parameters, if: :devise_controller?

 def after_sign_in_path_for(resource)
     user_path(current_user) # ログイン後に遷移するpathを設定
  	end
  	


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end



end
