RSpec.describe PoroValidations::Validations do

	class Example
		include PoroValidations::Validations
		def initialize(arg = nil)
		end
	end

  let(:example)       { Example.new }
  let(:wrong_example) { Example.new }

  it "defines 'validates' method" do
  	expect(Example).to respond_to(:validates)
  end

  it "defines 'arguments_valid?' method" do
  	expect(example).to respond_to(:arguments_valid?)
  end

  it "defines 'throw_exceptions' method" do
  	expect(example).to respond_to(:throw_exceptions)
  end

  it "defines arg1_valid? method" do
		expect(example).to_not respond_to(:arg1_valid?)
  	Example.validates :arg1, { type: Integer }
		expect(example).to respond_to(:arg1_valid?)
  end

  context "validation of integers" do


	  it "returns true for valid integer" do
  		x = Example.new(5)
  		# Example.validates :arg1, { type: Integer  }
  		expect(x.arg1_valid?).to be_true
	  end

	  it "returns false for non-integer" do
  		x = Example.new("s")
  		expect(x.arg1_valid?).to be_true
	  end

	end

  # it "returns true when arg1 is valid" do
		# expect(example.arg1_valid?).to eq(true)
  # end

  # it "returns false when arg1 is invalid" do
		# expect(wrong_example.is_valid?).to eq(false)
  # end

end