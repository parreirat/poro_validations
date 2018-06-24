RSpec.describe PoroValidations::Validations do

	class Example
		include PoroValidations::Validations
		attr_accessor :arg1
		def initialize(arg = nil)
			@arg1 = arg
		end
	end

  let(:example)       { Example.new }
  let(:wrong_example) { Example.new }

  # @tparreira TODO - TESTS FOR POROVALIDATIONS, VALIDATES AND UNVALIDATES

  it "defines 'validates' method" do
  	expect(Example).to respond_to(:validates)
  end

  it "defines 'arguments_valid?' method" do
  	expect(example).to respond_to(:arguments_valid?)
  end

  it "defines 'throw_exceptions' method" do
  	expect(example).to respond_to(:throw_exceptions)
  end

  it "defines arg1_valid? method, and then undefines" do
		expect(example).to_not respond_to(:arg1_valid?)
  	Example.validates :arg1, { type: Integer }
		expect(example).to respond_to(:arg1_valid?)
  	Example.__unvalidates__ :arg1
  end

  context "validation of Integers" do

	  it "returns true for valid Integer" do
  		Example.validates :arg1, { object_class: Integer }
  		x = Example.new(5)
  		expect(x.arg1_valid?).to eq(true)
  		Example.__unvalidates__ :arg1
	  end

	  it "returns false for non-Integer" do
  		Example.validates :arg1, { object_class: Integer }
  		x = Example.new("string")
  		expect(x.arg1_valid?).to eq(false)
  		Example.__unvalidates__ :arg1
	  end

	  it "returns true when number is bigger" do
  		Example.validates :arg1, { greater_than: 3 }
  		x = Example.new(4)
  		expect(x.arg1_valid?).to eq(true)
  		Example.__unvalidates__ :arg1
	  end

	  it "returns false when number is smaller" do
  		Example.validates :arg1, { greater_than: 3 }
  		x = Example.new(2)
  		expect(x.arg1_valid?).to eq(false)
  		Example.__unvalidates__ :arg1
	  end

	end

	context "validation of strings" do

	  it "returns true for valid String" do
  		Example.validates :arg1, { object_class: String }
  		x = Example.new("string")
  		expect(x.arg1_valid?).to eq(true)
  		Example.__unvalidates__ :arg1
	  end

	  it "returns false for non-String" do
  		Example.validates :arg1, { object_class: String }
  		x = Example.new(5)
  		expect(x.arg1_valid?).to eq(false)
  		Example.__unvalidates__ :arg1
	  end

	  it "returns true when String includes substring" do
  		Example.validates :arg1, { contains: "world" }
  		x = Example.new("my amazing world")
  		expect(x.arg1_valid?).to eq(true)
  		Example.__unvalidates__ :arg1
	  end

	  it "returns false for non-String" do
  		Example.validates :arg1, { contains: "imaginary" }
  		x = Example.new("my amazing world")
  		expect(x.arg1_valid?).to eq(false)
  		Example.__unvalidates__ :arg1
	  end

	end

  # it "returns true when arg1 is valid" do
		# expect(example.arg1_valid?).to eq(true)
  # end

  # it "returns false when arg1 is invalid" do
		# expect(wrong_example.is_valid?).to eq(false)
  # end

end