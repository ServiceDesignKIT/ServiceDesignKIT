class Users::PasswordsController < Devise::PasswordsController

  # POST /resource/password
  def create
    if request.format == :json
      self.resource = resource_class.send_reset_password_instructions(resource_params)
      yield resource if block_given?

      if successfully_sent?(resource)
        render json: { token: form_authenticity_token  }, status: 200
      else
        render json: { token: form_authenticity_token  }, status: 404
      end
    else
      super
    end
  end


  # PUT /resource/password
  def update
    if request.format == :json
      self.resource = resource_class.reset_password_by_token(resource_params)
      yield resource if block_given?
      if resource.errors.empty?

        resource.unlock_access! if unlockable?(resource)
        if Devise.sign_in_after_reset_password
          message = resource.active_for_authentication? ? :updated : :updated_not_active
          sign_in(resource_name, resource)

          render json: { message: message,  token: form_authenticity_token  }, status: 200
        else

          render json: { message: :updated_not_active, token: form_authenticity_token  }, status: 400
        end
      else
        render json: { errors: resource.errors.full_messages, token: form_authenticity_token  }, status: 422
      end
    else
      super
    end
  end

end