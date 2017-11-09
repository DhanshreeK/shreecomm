require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EducationalConsultant
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.secret_key_base  = '7cf1c5a1352109dc92a4a27da9703a8e543068a33474a4ee8ae30d9efed1ae345338a8e5c9a1880b481b8c617fc8c04314a4ee89eed9f6f516e2bdbed6f1e41e'
  end
end
