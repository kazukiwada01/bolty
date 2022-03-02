class ProblemsController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :create, :edit, :destroy]
  before_action :set_problem_list, only: [:index, :create, :edit, :update, :destroy]
  before_action :problem_list_check, only: [:index, :edit, :update, :destroy]
  before_action :set_problem, only: [:edit, :update, :destroy]

  def index
    if params[:option] == "B" || params[:option] == nil
      @problems = @problem_list.problems.order(id: :desc)
    elsif params[:option] == "A"
      @problems = @problem_list.problems.order(id: :asc)
    elsif params[:option] == "C"
      @problems = @problem_list.problems.order(name: :asc).order(grade_id: :asc)
    elsif params[:option] == "D"
      @problems = @problem_list.problems.order(name: :desc).order(grade_id: :asc)
    elsif params[:option] == "E"
      @problems = @problem_list.problems.order(grade_id: :asc).order(name: :asc)
    elsif params[:option] == "F"
      @problems = @problem_list.problems.order(grade_id: :desc).order(name: :asc)
    end
    @problem = Problem.new
  end

  def create
    @problem = Problem.new(problem_params)
    if @problem.save
      redirect_to gym_problem_list_problems_path
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

  def destroy
    @problem.delete
    redirect_to gym_problem_list_problems_path
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

  def problem_list_check
    unless @problem_list.admin == current_admin
      redirect_to admin_path(current_admin)
    end
  end
end