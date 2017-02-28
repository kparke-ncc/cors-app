class ResponsesController < ApplicationController
	# disables CSRF check since http request is done as an XML request
	skip_before_action :verify_authenticity_token

	def new
	end

	def create
		puts "!!!!!!!! Hit response create controller"
		
		response = request.body.read
		puts "************#{response}"
#		@response = Response.new(response_params)
#		
#		puts "??????????? #{@response}"
#		# @response.save
#
#		redirect to @response

	end

#private
#	def response_params
#		params.require(:text)
#	end

end
