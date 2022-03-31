class ResultsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create, :edit, :update]
  before_action :set_problem, only: [:edit, :update]
  before_action :set_result, only: [:edit, :update]

  def index
    @problem = Problem.find(params[:problem_id])
    @result = Result.new
  end

  def create
    @result = Result.create(result_params)
    redirect_to gym_problem_list_problems_path
  end

  def edit
  end

  def update
    @result.update(result_params)
    redirect_to gym_problem_list_problems_path
  end

  private

  def result_params
    params.require(:result).permit(:climb, :holding, :physical, :move, :positioning, :footwork,
                                   :coordination).merge(user_id: current_user.id, gym_id: params[:gym_id], problem_id: params[:problem_id])
  end

  def set_problem
    @problem = Problem.find(params[:problem_id])
  end

  def set_result
    @result = Result.find(params[:id])
  end
end
