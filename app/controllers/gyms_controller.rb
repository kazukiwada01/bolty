class GymsController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :edit]

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

  private

  def gym_params
    params.require(:gym).permit(:image, :name, :prefecture_id, :city_name, :street, :building_name, :gym_url).merge(admin_id: current_admin.id)
  end
end
