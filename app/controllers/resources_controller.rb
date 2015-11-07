class ResourcesController < ApplicationController
  # GET /resources/10.json
  # GET /resources/10/after/1.json
  def index
    @resources = Resource.where(rated: 'unrated').limit(params[:count])
    if params[:after]
      @resources = @resources.where('id > ?', params[:after])
    end
  end

  # POST /resources/1/remark.json?remark={"description":"good", "mark": "10"}
  def remark
    json = JSON.parse(params[:remark])

    r = Resource.find(params[:id])
    r.rated = 'rated'
    r.mark = json['mark']
    r.description = json['description']
    r.save
    render json: { status: 'success' }
  end
end
