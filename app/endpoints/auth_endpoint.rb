# frozen_string_literal: true

class AuthEndpoint < Application
  post '/' do
    operation = Operations::Auth::Create.new
    result = operation.call(params)

    case result
    when Success
      meta = { user_id: result.value!.id }

      status 200
      json meta: meta
    when Failure
      status 401
      error_response result.failure
    end
  end
end
