# frozen_string_literal: true

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end
end

# Associated object must be saved in Sequel
# https://stackoverflow.com/questions/43590251/associated-object-does-not-have-a-primary-key/43592300#43592300
FactoryBot.use_parent_strategy = false

FactoryBot.define { to_create(&:save) }
