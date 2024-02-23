require 'date'

# Function to calculate payroll data for a bi-weekly schedule
def calculate_payroll_data_biweekly(starting_date)
  # Initialize an empty array to store the data
  payroll_data = []

  # Find the next Friday from the provided starting date
  starting_date = starting_date + (5 - starting_date.wday) % 7

  # Iterate through each bi-week of the year
  26.times do |biweek|
    # Calculate the start date, end date, and pay date for each bi-week
    start_date = starting_date + (biweek * 14)
    end_date = start_date + 13 # Thursday two weeks after
    pay_date = end_date + 6 + (5 - (end_date + 7).wday) % 7 # Thursday of the next week after ending day

    # Add data to the array
    payroll_data << { Start_Date: start_date.strftime('%Y-%m-%d'), End_Date: end_date.strftime('%Y-%m-%d'), Pay_Date: pay_date.strftime('%Y-%m-%d') }
  end

  payroll_data
end

# Get user input for the starting day
print 'Enter the starting day of work (YYYY-MM-DD): '
starting_day = gets.chomp

# Parse the input starting day as a Date object
starting_date = Date.parse(starting_day)

# Calculate payroll data for the entire year with a bi-weekly schedule
payroll_data_biweekly = calculate_payroll_data_biweekly(starting_date)

# Print the formatted payroll data for a bi-weekly schedule
puts "Start_Date   |   End_Date    |   Pay_Date"
puts "----------------------------------------"
payroll_data_biweekly.each do |entry|
  puts "#{entry[:Start_Date]}   |   #{entry[:End_Date]}   |   #{entry[:Pay_Date]}"
end
