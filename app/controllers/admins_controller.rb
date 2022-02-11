class AdminsController < ApplicationController
  before_action :authenticate_admin!, only: [:show, :edit]

  def show
    @admin = Admin.find(params[:id])
  end

  def edit
  end

  def update
    if current_admin.update_with_password(admin_params)
      redirect_to admin_session_path
    else
      render :edit
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:password, :password_confirmation, :current_password)
  end
end