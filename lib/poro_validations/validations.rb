module PoroValidations

	module Validations

		# Use Hash.new to make any top-level key have "attributes" by default
		@validations = {}

		def self.__validations__
			@validations
		end

		def self.__add_validation__(_klass_, _attribute_, _validations_)
			klass_hash_key = _klass_.to_s.to_sym
			@validations[klass_hash_key] = { _attribute_.to_sym => _validations_}
		end

		# For testing purposes... didn't find a better way for now.
		def self.__unvalidates_klass__(_klass_)
			binding.pry
			klass_hash_key = _klass_.to_s.to_sym
			@validations[klass_hash_key] = {}
		end

		# self.attr_accessor :__validations__
		# def self.b
		# 	puts "class method DOES NOT WORK!"
		# end

		# def a
		# 	puts "instance method works!"
		# end

		# base is the class in which it's included
		def self.included(base)

			base.attr_accessor :__errors__
			# base.__errors__ = []
			base.attr_accessor :__exceptions__
			# base.__exceptions__ = []
			# base.__validations__ = []
			# binding.pry
			# base.errors = [1,2,3]

			def base.validates(attribute, validations = {})
				Validations.__add_validation__(self, attribute, validations)
				# if attribute_exists?(attribute)
					define_method("#{attribute}_valid?".to_sym) do
						# binding.pry
					end
				# else
				# 	raise ArgumentError,
				# 		"Class '#{self.class}' does not respond to '#{attribute}'!"
				# end
			end

			# Check if attributes that :validates is being called for exists.
			# def attribute_exists?(attribute)
			# 	binding.pry
			# end

			# Calls for all of invoking method's arguments (just #initialize?)
			def arguments_valid?
				klass_hash_key = self.class.to_s.to_sym
				validations_for_klass = Validations.__validations__.fetch(klass_hash_key, {})
				validations_for_klass.keys.each do |attribute|
					self.send("#{attribute}_valid?")
					# Add errors here? Inside *_valid?
				end
			end

			def throw_exceptions

			end

		end

	end

end