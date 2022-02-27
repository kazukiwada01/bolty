class ProblemsController < ApplicationController
  before_action :authenticate_admin!, only: [:create, :edit]
  before_action :set_problem_list, only: [:index, :create]
  before_action :set_problem, only: [:edit, :update]

  def index
    @problems = @problem_list.problems.includes(:problem_list_id)
    @problem = Problem.new
  end

  def create
    @problem = Problem.new(problem_params)
    if @problem.save
      redirect_to gym_problem_list_problems_pathd
    end
  end

  def edit
  end

  def update
    if @problem.update(problem_params)
      redirect_to gym_problem_list_problems_path
    else
      render :edit
    end
  end

  private

  def problem_params
    params.require(:problem).permit(:name, :grade_id, :holding, :physical, :move, :positioning,
      :footwork, :coordination).merge(admin_id: current_admin.id, problem_list_id: params[:problem_list_id])
  end

  def set_problem_list
    @problem_list = ProblemList.find(params[:problem_list_id])
  end

  def set_problem
    @problem = Problem.find(params[:id])
  end
end