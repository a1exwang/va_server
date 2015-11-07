class ResourcesController < ApplicationController
  # GET /resources/count.json
  def index
    @resources = Resource.where(rated: 'unrated').limit(params[:count])
  end

  # POST /resources/1/remark/mark.json
  def remark
    r = Resource.find(params[:id])
    r.rated = 'rated'
    r.mark = params[:mark]
    r.save
    render json: { status: 'success' }
  end
end
