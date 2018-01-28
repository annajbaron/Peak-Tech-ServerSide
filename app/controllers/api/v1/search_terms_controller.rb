class Api::V1::SearchTermsController < Api::ApplicationController

  before_action :authenticate_user!
  before_action :find_search_term, only: [:show, :destroy, :update]
  before_action :verify_admin!

    def index
      search_terms = SearchTerm.order(created_at: :desc)
      render json: search_terms
    end

    def show
      render json: @search_term
    end

    def create
      search_term = SearchTerm.new(search_term_params)

      if search_term.save
        render json: search_term
      else
        render json: { error: search_term.errors.full_messages }
      end
    end

    def update
      if @search_term.update search_term_params
        render json: @search_term
      else
        render json: { error: @search_term.errors.full_messages }
      end
    end

    def destroy
      if @search_term.destroy
        render json: { message: 'Successfully deleted!!!' }
      else
        head :bad_request
      end
    end

  private

  def find_search_term
    @search_term = SearchTerm.find params[:id]
  end

  def search_term_params
     params.require(:search_term).permit(:title)
  end

end
