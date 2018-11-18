class ApiController < ApplicationController

  def index
    response = {
      status: status,
      url: api_params[:url]
    }
    response.merge!(serialized_resource) if serialized_resource
    render json: response
  end

  private

  def resource
    @resource ||= Resource.find_by(path: api_params[:url])
  end

  def status
    if serialized_resource
      200
    else
      404
    end
  end

  def serialized_resource
    @serialized_resource ||= if resource
      ResourceSerializer.new(resource).serializable_hash
    else
      nil
    end
  end

  def api_params
    params.permit(:url)
  end
end
