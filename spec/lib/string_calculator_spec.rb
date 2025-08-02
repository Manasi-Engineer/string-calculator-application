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

  it "supports custom delimiter with semicolon" do
    expect(calculator.add("//;\n1;2;4")).to eq(7)
  end

  it "raises error for a single negative number" do
    expect {
      calculator.add("1,-2,3,-4")
    }.to raise_error(StringCalculator::NegativeNumberExistsError, "Negative numbers not allowed: -2,-4")
  end

  it "returns the sum by ignoring number greater then 1000" do
    expect(calculator.add("1,1002")).to eq(3)
  end

  it "supports custom mulitple character delimiter" do
    expect(calculator.add("//[***]\n1***2***3")).to eq(6)
  end

  it "supports custom multiple with multi character [] delimiter" do
    expect(calculator.add("//[***][&]\n1***2***3&4")).to eq(10)
  end

  it "supports custom  multi character delimiter" do
    expect(calculator.add("//***\n1***2***3***4")).to eq(10)
  end
end
