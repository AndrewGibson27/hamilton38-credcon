class ApiController < ApplicationController

  def index
    data = {
      status: response.status,
      url: api_params[:url]
    }

    render json: data
  end

  private

  def api_params
    params.permit(:url)
  end
end
