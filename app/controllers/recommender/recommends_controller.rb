require_dependency "recommender/application_controller"

module Recommender
  class RecommendsController < ApplicationController
    respond_to :json
    before_filter :get_params, only: [:create, :update]
    
    def index
      @recommends = Recommend.all
    end
    
    def show
      @recommend = Recommend.find(params[:id])
    end
    
    def create
      respond_with Recommend.create(@params)
    end
    
    def update
      respond_with Recommend.update(params[:id], @params)
    end
    
    def destroy
      respond_with Recommend.destroy(params[:id])
    end

    def choice
      @recommend = Recommend.find(params[:id])
      @resources = Resource.find_all_by_id(params[:choices])
      @product = @recommend.get_closest(@resources)
      render partial: 'recommender/products/model', locals: { product: @product }
    end

    private
      def get_params
        @params = params.slice(:title, :dynamic_fields)
      end
  end
end
