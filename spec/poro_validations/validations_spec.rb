RSpec.describe PoroValidations::Validations do

	class Example
		attr_accessor :arg1
		include PoroValidations
		validate :arg1, { type: Integer  }

	  def initialize(arg1)
	  	# arguments_valid? # Run all registered common validations plus custom ones
	  	# throw_exceptions # Throw exception with array of exception messages
	  	# @arg1 = arg1
	  	# ...
	  end

	  # private

	  # 	# Have to define this method
	  # 	def arg1_custom_validation

	  # 	end

	  # end

	  let(:example)       { Example.new(0) }
	  let(:wrong_example) { Example.new("invalid") }

	  it "defines arg1_valid? method" do
			expect(example.respond_to?(:arg1_valid?))
	  end

	  it "returns true when arg1 is valid" do
			expect(example.arg1_valid?).to eq(true)
	  end

	  it "returns false when arg1 is invalid" do
			expect(wrong_example.is_valid?).to eq(false)
	  end

end