# frozen_string_literal: true

class User < BaseModel
  EMAIL_FORMAT = %r{\A\w+@\w+\.\w+}.freeze

  plugin :association_dependencies
  plugin :secure_password, include_validations: false

  one_to_many :sessions, class: :UserSession

  add_association_dependencies sessions: :delete

  def validate
    super

    validates_presence :name,     message: model_error(:name, :blank)
    validates_presence :email,    message: model_error(:email, :blank)
    validates_presence :password, message: model_error(:password, :blank) if new?

    validates_format EMAIL_FORMAT, :email, message: model_error(:email, :format)
  end
end
