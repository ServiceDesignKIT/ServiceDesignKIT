class  Users::RegistrationsController < Devise::RegistrationsController

  # GET /users/sign_up
  def new
    super
  end

  # POST /users
  def create
    if request.format == :json
      build_resource(sign_up_params)
      resource.save

      if resource.persisted?
        if resource.active_for_authentication?
          sign_up(resource_name, resource)

          render json: { user: current_user, token: form_authenticity_token  }, status: 201
        else
          expire_data_after_sign_in!

          render json: { error: resource.inactive_message, token: form_authenticity_token  }, status: 403
        end
      else
        render json: { errors: resource.errors.full_messages, token: form_authenticity_token  }, status: 422
      end
    else
      super
    end
  end


end