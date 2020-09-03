# frozen_string_literal: true

class BaseModel < Sequel::Model
  private

  def model_error(attr, reason)
    I18n.t(reason, scope: "model.errors.#{self.calss.underscore}.#{attr}")
  end
end
