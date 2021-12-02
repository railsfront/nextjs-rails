class Api::V1::DashboardsController < Api::V1::BaseController
  def index
    render json: { current_user: current_user }
  end
end
