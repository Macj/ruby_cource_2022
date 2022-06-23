class AlexController < ApplicationController

	def time

		@time = Time.now

	end

	def name
		@name = "cheburashka"
	end

end
