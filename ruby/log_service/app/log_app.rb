
# Scenario:
# TODO:
=begin 
Problem: Log File Parser

You are given a set of server log entries, each representing a request. Your task is to process these logs and generate insights.
Input:

A list of log entries in the following format:

"timestamp, ip_address, status_code"

For example:

logs = [
  "2025-03-06T12:00:00Z, 192.168.1.1, 200",
  "2025-03-06T12:00:05Z, 192.168.1.2, 404",
  "2025-03-06T12:00:10Z, 192.168.1.1, 500",
  "2025-03-06T12:00:15Z, 192.168.1.3, 200",
  "2025-03-06T12:00:20Z, 192.168.1.2, 200"
]

Requirements:

    Implement a function to parse these log entries into structured data.
    Implement a function to count occurrences of each HTTP status code.
    Implement a function to find the most frequent IP address in the logs.

Expected Output:

parse_logs(logs) 
# => [
#   { timestamp: "2025-03-06T12:00:00Z", ip: "192.168.1.1", status: 200 },
#   { timestamp: "2025-03-06T12:00:05Z", ip: "192.168.1.2", status: 404 },
#   ...
# ]

count_status_codes(logs)
# => { 200 => 3, 404 => 1, 500 => 1 }

most_frequent_ip(logs)
# => "192.168.1.1"  # or "192.168.1.2" (if tied)
=end

def sample_function()
    return "Hello World"
end


# loop do
#     puts "Greetings, User!"
#     command = gets.chomp.upcase
#     if command
#         puts "Invalid command"
#     end
# end
