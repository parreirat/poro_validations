module PoroValidations

	module Validations
		# def self.b
		# 	puts "class method DOES NOT WORK!"
		# end

		# def a
		# 	puts "instance method works!"
		# end

		# base is the class in which it's included
		def self.included(base)

			base.attr_accessor :__errors__
			base.attr_accessor :__exceptions__
			base.attr_accessor :__validations__
			# binding.pry
			# base.errors = [1,2,3]

			def base.validate(attribute, validations = {})

			end

			def base.arguments_valid?

			end

			def base.throw_exceptions

			end

		end

	end

end