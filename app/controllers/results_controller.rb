class ResultsController < ApplicationController
  def index
    @problem = Problem.find(params[:problem_id])
    @result = Result.new
  end

  def create
    @result = Result.create(result_params)
    redirect_to gym_problem_list_problems_path
  end

  private

  def result_params
    params.require(:result).permit(:climb, :holding, :physical, :move, :positioning, :footwork,
      :coordination).merge(user_id: current_user.id, gym_id: params[:gym_id], problem_id: params[:problem_id])
  end
end