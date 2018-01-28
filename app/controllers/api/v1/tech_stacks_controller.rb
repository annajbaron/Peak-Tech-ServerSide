class Api::V1::TechStacksController < Api::ApplicationController
  before_action :authenticate_user!
  before_action :find_tech_stack, only: [:show, :destroy]

  def show
    render json: @tech_stack
  end

  def index
    @tech_stacks = TechStack.order(created_at: :desc)
    render json: @tech_stacks
  end

  def create
    tech_stack = TechStack.new tech_stack_params

    if tech_stack.save
      render json: tech_stack
    else
      render json: { error: tech_stack.errors.full_messages}
    end

  end

  def destroy
    if @tech_stack.destroy
      head :ok
    else
      head :bad_request
    end
  end

  private

  def find_tech_stack
    @tech_stack = TechStack.find params[:id]
  end

  def tech_stack_params
    params.require(:tech_stack).permit(:name)
  end


end
