# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :reject_user, :configure_sign_in_params, only: [:create]

  protected
  def after_sign_in_path_for(resource)
    my_page_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name])
  end

  def reject_user
    @user = User.find_by(email: params[:user][:email])
    if @user
      if @user.valid_password?(params[:user][:password]) &&  (@user.is_deleted == true)
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_user_session_path
      else
        flash[:notice] = "項目を入力してください"
      end
    end
  end
end
