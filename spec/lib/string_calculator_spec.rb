# spec/string_calculator_spec.rb

require_relative '../../lib/string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  it "returns 0 for an empty string" do
    expect(calculator.add("")).to eq(0)
  end

  it "returns 0 for an empty string" do
    expect(calculator.add("1")).to eq(1)
  end
  
  it "returns the sum of two comma-separated numbers" do
    expect(calculator.add("1,2")).to eq(3)
  end

  it "handles new line as a delimiter" do
    expect(calculator.add("1\n2,3")).to eq(6)
  end

  it "handles new line and comma as a delimiter" do
    expect(calculator.add("1\n2,3,4,\n5")).to eq(15)
  end
end
