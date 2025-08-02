# lib/string_calculator.rb

class StringCalculator
  class NegativeNumberExistsError < StandardError; end
  DEFAULT_DELIMITERS = [",", "\n"].freeze

  def add(numbers)
    # String with no delimiter only number
    return numbers.to_i if is_numeric_regex?(numbers)

    delimiters, numbers_part = extract_delimiters_and_numbers(numbers)

    # Split based on delimiters
    number_only_list = numbers_part.split(Regexp.union(delimiters)).map do |str|
      number = str.to_i
      if number > 1000
        number % 1000
      elsif number
        number
      end
    end
    
    # Validate if negative number present
    negatives = number_only_list.select { |n| n < 0 }
    raise NegativeNumberExistsError, "Negative numbers not allowed: #{negatives.join(',')}" unless negatives.empty?

    # Sum of numbers
    number_only_list.sum
  end

  def is_numeric_regex?(str)
    return "" if str.empty?
    str.match?(/\A\d+\z/)
  end

  def extract_delimiters_and_numbers(input)
    # Handle string starts with // for custom delimitor
    # If not send the default delimiter
    # Returns delimiters and number section along with delimiters only 
    if input.start_with?("//")
      delimiter_line, rest = input.split("\n", 2)
      delimiters = if delimiter_line.include?("[")
        # Multi-character delimiters between [ and ]
        delimiter_line.scan(/\[(.*?)\]/).flatten
      else
         [delimiter_line[2..]]
      end
      [delimiters, rest]
    else
      [DEFAULT_DELIMITERS, input]
    end
  end
end
