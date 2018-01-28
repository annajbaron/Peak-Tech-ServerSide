class Api::V1::OrganizationsController < Api::ApplicationController
  before_action :authenticate_user!
  before_action :find_organization, only: [:show, :update, :destroy]

  def show
    render json: @organization
  end

  def index
    scope = Organization.order(created_at: :desc)

    if params[:search_term]
      scope = scope.where("name LIKE ?", "%#{params[:search_term]}%")
    end

    if params[:page]
      scope = scope.page(params[:page])
    end

    render json: scope
  end

  def create
    organization = Organization.new organization_params

    if organization.save
      render json: organization
    else
      render json: { error: organization.errors.full_messages}
    end

  end

  def update
    @organization.slug = nil
    if @organization.update organization_params
      render json: @organization
    else
      render json: { error: @organization.errors.full_messages }
    end
  end

  def destroy
    if @organization.destroy
      head :ok
    else
      head :bad_request
    end
  end

  private

  def find_organization
    @organization = Organization.find params[:id]
  end

  def organization_params
    params.require(:organization).permit(:name, :address, :overview, :employees, :team_size, :website, :twitter, :logo, :tech_stack_ids => [])
  end

end
