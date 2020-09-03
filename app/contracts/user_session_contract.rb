# frozen_string_literal: true

class UserSessionContract < BaseContract
  params do
    required(:email).filled(:string)
    required(:password).filled(:string)
  end
end
