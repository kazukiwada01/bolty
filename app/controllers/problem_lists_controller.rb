class ProblemListsController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :edit]
  before_action :set_gym, only: [:index, :create, :edit, :update]
  before_action :set_problem_list, only: [:edit, :update]

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

  def edit
  end

  def update
    if @problem_list.update(problem_list_params)
      redirect_to gym_problem_lists_path
    else
      render :edit
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

  def set_problem_list
    @problem_list = ProblemList.find(params[:id])
  end
end
