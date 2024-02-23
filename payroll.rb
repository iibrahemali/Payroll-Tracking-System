require 'date'

def calculate_payroll_dates(starting_month_day)
  # Parse the input starting month and day as a Date object for the current year
  starting_date = Date.parse("#{Date.today.year}/#{starting_month_day}")

  # Calculate the period ending
  period_ending = starting_date + 14

  # Calculate the pay date
  pay_date = period_ending + 7

  # Get user input for hours worked and pay hour rate
  print "Enter the number of hours worked: "
  hours_worked = gets.chomp.to_f

  print "Enter the pay hour rate: "
  pay_hour_rate = gets.chomp.to_f

  # Calculate earnings before tax
  earnings_before_tax = hours_worked * pay_hour_rate

  # Deduct 14% tax
  tax_percentage = 14.2
  tax_amount = earnings_before_tax * (tax_percentage / 100)
  earnings_after_tax = earnings_before_tax - tax_amount

  # Output the calculated dates and earnings
  puts "___________________________________________________\n\n"
  puts "the period ending is: #{period_ending.strftime('%Y/%m/%d')}"
  puts "the pay date is: #{pay_date.strftime('%Y/%m/%d')}"
  puts "earnings before tax: $#{earnings_before_tax}"
  puts "tax deduction (#{tax_percentage}%): $#{tax_amount}"
  puts "earnings after tax: $#{earnings_after_tax}"
end

# Get user input for the starting month and day
print "enter the starting month and day of work (MM/DD): "
starting_month_day = gets.chomp

# Calculate and display the payroll dates and earnings
calculate_payroll_dates(starting_month_day)
