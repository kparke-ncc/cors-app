require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module YayApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.


     config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :options]
      end
    end


# Another attempt to disable cors
config.action_dispatch.default_headers = {
    'Access-Control-Allow-Origin' => 'http://my-web-service-consumer-site.com',
    'Access-Control-Request-Method' => %w{GET POST OPTIONS}.join(",")
  }


# Another attempt to disable cors
 	after_filter :cors_set_access_control_headers

# For all responses in this controller, return the CORS access control headers.

	def cors_set_access_control_headers
  		headers['Access-Control-Allow-Origin'] = '*'
  		headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
 	 	headers['Access-Control-Allow-Headers'] = '*'
  		headers['Access-Control-Request-Method'] = '*',
		headers['Access-Control-Max-Age'] = "1728000"
	end

# If this is a preflight OPTIONS request, then short-circuit the
# request, return only the necessary headers and return an empty
# text/plain.

	def cors_preflight_check
	  if request.method == :options
	    headers['Access-Control-Allow-Origin'] = '*'
	    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
	    headers['Access-Control-Allow-Headers'] = '*'
	    headers['Access-Control-Request-Method'] = '*' 
	    headers['Access-Control-Max-Age'] = '1728000'
	    render :text => '', :content_type => 'text/plain'
	  end
	end


  end
end

