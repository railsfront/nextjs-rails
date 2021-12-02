class Api::V1::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    resource.persisted? ? log_in_success : log_in_failure
  end

  def respond_to_on_destroy
    current_user ? log_out_success : log_out_failure
  end

  def log_in_success
    render json: {
      user: {
        email: resource.email,
        token: equest.env["warden-jwt_auth.token"]
      }
    }, status: :ok
  end

  def log_in_failure
    render json: { errors: { "email or password": ["is invalid"] } },
           status: :unprocessable_entity
  end

  def log_out_success
    render json: { message: "You are logged out" },
           status: :ok
  end

  def log_out_failure
    render json: { errors: "Error logging out" },
           status: :unprocessable_entity
  end
end