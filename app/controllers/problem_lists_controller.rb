class ProblemListsController < ApplicationController
  before_action :set_gym, only: [:index, :create]

  def index
    @problem_lists = @gym.problem_lists.includes(:gym)
  end

  def new
    @problem_list = ProblemList.new
  end

  def create
    @problem_list = ProblemList.new(problem_list_params)
    if @problem_list.save
      redirect_to gym_problem_lists_path
    else
      render :new
    end
  end

  private

  def problem_list_params
    params.require(:problem_list).permit(:name, :timestamps).merge(
      admin_id: current_admin.id, gym_id: @gym.id)
  end

  def set_gym
    @gym = Gym.find(params[:gym_id])
  end
end
