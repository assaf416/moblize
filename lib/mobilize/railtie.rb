module Mobilize
  class Railtie < Rails::Railtie
    initializer 'moblize.model_additions' do
      ActiveSupport.on_load :active_record do
        extend ModelAdditions
      end
    end
  end
end