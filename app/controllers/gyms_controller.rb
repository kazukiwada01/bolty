class GymsController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :edit, :destroy]
  before_action :set_gym, only: [:edit, :update, :destroy]

  def new
    @gym = Gym.new
  end

  def create
    @gym = Gym.new(gym_params)
    if @gym.save
      redirect_to admin_path(current_admin)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @gym.update(gym_params)
      redirect_to admin_path(current_admin)
    else
      render :edit
    end
  end

  def destroy
    @gym.delete
    redirect_to admin_path(current_admin)
  end

  private

  def gym_params
    params.require(:gym).permit(:image, :name, :prefecture_id, :city_name, :street, :building_name, :gym_url).merge(admin_id: current_admin.id)
  end

  def set_gym
    @gym = Gym.find(params[:id])
  end
end
