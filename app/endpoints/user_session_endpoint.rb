# frozen_string_literal: true

class UserSessionEndpoint < Application
  post '/' do
    operation = Operations::UserSessions::Create.new
    result    = operation.call(params)

    case result
    when Success
      token = JwtEncoder.encode(uuid: result.value!.uuid)

      status 201
      json meta: { token: token }
    when Failure
      status 401
      error_response result.failure
    end
  end
end
