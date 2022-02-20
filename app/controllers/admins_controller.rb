class AdminsController < ApplicationController
  before_action :authenticate_admin!, only: [:show, :edit]
  before_action :set_admin, only: [:show, :edit]
  before_action :admin_check, only: [:show, :edit]

  def show
    @gyms = @admin.gyms.includes(:admin)
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

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_check
    unless @admin == current_admin
      redirect_to admin_path(current_admin)
    end
  end
end
