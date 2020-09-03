# frozen_string_literal: true

class UserSession < BaseModel
  plugin :uuid

  many_to_one :user

  def validate
    super

    validates_presence :uuid, message: model_error(:uuid, :blank)
  end
end
