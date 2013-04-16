require_dependency "recommender/application_controller"

module Recommender
  class ResourcesController < ApplicationController
    respond_to :json
    before_filter :get_scope
    before_filter :get_params, only: [:create, :update]
    
    def index
      @resources = @scope.all
    end
    
    def show
      @resource = @scope.find(params[:id])
    end
    
    def create
      respond_with @scope.create(@params)
    end
    
    def update
      respond_with @scope.update(params[:id], @params)
    end
    
    def destroy
      respond_with @scope.destroy(params[:id])
    end

    private
      def get_scope
        @scope = if params[:recommend_id] then Recommend.find(params[:recommend_id]).resources else Resource end
      end

      def get_params
        @params = params.slice(:resource_id, :dynamic_attributes)
      end
  end
end