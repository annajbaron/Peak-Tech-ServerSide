class Api::V1::MeetUpsController < Api::ApplicationController

  before_action :authenticate_user!
  before_action :find_meet_up, only: [:show, :destroy, :update]
  before_action :verify_admin!

    def index
      meet_ups = meet_up.order(created_at: :desc)
      render json: meet_ups
    end

    def show
      render json: @meet_up
    end

    def create
      meet_up = MeetUp.new(meet_up_params)

      if meet_up.save
        render json: meet_up
      else
        render json: { error: meet_up.errors.full_messages }
      end
    end

    def update
      if @meet_up.update meet_up_params
        render json: @meet_up
      else
        render json: { error: @meet_up.errors.full_messages }
      end
    end

    def destroy
      if @meet_up.destroy
        render json: { message: 'Successfully deleted!!!' }
      else
        head :bad_request
      end
    end

  private

  def find_meet_up
    @meet_up = MeetUp.find params[:id]
  end

  def meet_up_params
     params.require(:meet_up).permit(:name)
  end

end
