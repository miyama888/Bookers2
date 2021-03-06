class ApplicationController < ActionController::Base
	before_action :authenticate_user!,except: [:top, :about] #ログインしていなければログイン画面へリダイレクト

	before_action :configure_permitted_parameters, if: :devise_controller?

  
   # Welcome! You have signed up successfully.
  def after_sign_in_path_for(resource)
    flash[:notice] = "Signed in successfully."
    user_path(current_user)  # ログイン後に遷移するpathを設定
  end

  def after_sign_out_path_for(resource) 

    root_path notice: "Signed out successfully."
# ログアウト後に遷移するpathを設定
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end



end
