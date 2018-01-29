class Api::V1::StoriesController < Api::ApplicationController
   before_action :authenticate_user!, except: [:index]

   def index
     scope = Story.order(created_at: :desc)

     if params[:search_term_id]
       scope = scope.where(search_term_id: params[:search_term_id])
     end

     if params[:page]
       scope = scope.page(params[:page])
     end

     render json: scope, each_serializer: StorySerializer
   end

 end
