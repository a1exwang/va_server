class ResourcesController < ApplicationController
  # GET /resources/count.json
  def index
    @resources = Resource.where(rated: 'unrated').limit(params[:count])
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
