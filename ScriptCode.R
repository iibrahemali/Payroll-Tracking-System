library(data.table)

calculate_payroll_data_biweekly <- function(starting_date) {
  # Initialize an empty data.frame to store the data
  payroll_data <- data.frame(
    Start_Date = as.Date(character()), 
    End_Date = as.Date(character()), 
    Pay_Date = as.Date(character())
  )
  
  starting_date <- starting_date + (5 - as.numeric(format(starting_date, "%u"))) %% 7
  
  for (biweek in 0:25) {
    # Calculate the start date, end date, and pay date for each bi-week
    start_date <- starting_date + (biweek * 14)
    end_date <- start_date + 13  # Thursday two weeks after
    pay_date <- end_date + 6 + (5 - as.numeric(format(end_date + 7, "%u"))) %% 7  # Thursday of the next week after ending day
    
    # Add data to the data.frame
    payroll_data <- rbind(payroll_data, data.frame(Start_Date = start_date, End_Date = end_date, Pay_Date = pay_date))
  }
  
  payroll_data
}

starting_day <- readline("Enter the starting day of work (YYYY-MM-DD): ")

starting_date <- as.Date(starting_day)

payroll_data_biweekly <- calculate_payroll_data_biweekly(starting_date)

formatted_payroll_data_biweekly <- data.frame(
  Start_Date = format(payroll_data_biweekly$Start_Date, "%Y-%m-%d"),
  End_Date = format(payroll_data_biweekly$End_Date, "%Y-%m-%d"),
  Pay_Date = format(payroll_data_biweekly$Pay_Date, "%Y-%m-%d")
)

print(formatted_payroll_data_biweekly)
