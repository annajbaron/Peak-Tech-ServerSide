class Api::V1::EventsController < Api::ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    scope = Event.order(created_at: :desc)

    if params[:meet_up_id]
      scope = scope.where(meet_up_id: params[:meet_up_id])
    end

    if params[:page]
      scope = scope.page(params[:page])
    end

    render json: scope, each_serializer: EventSerializer
  end

end
