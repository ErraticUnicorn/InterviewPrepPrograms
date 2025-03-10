require "minitest/autorun"
require_relative "../app/log_service"
require_relative "../app/log_entry"

class LogServiceTest < Minitest::Test
    def test_parse_logs
      logs = [
        "2025-03-06T12:00:00Z, 192.168.1.1, 200",
        "2025-03-06T12:00:05Z, 192.168.1.2, 404",
        "2025-03-06T12:00:10Z, 192.168.1.1, 500",
        "2025-03-06T12:00:15Z, 192.168.1.3, 200",
        "2025-03-06T12:00:20Z, 192.168.1.2, 200",
      ]
      parsed_logs = LogService.parse_logs(logs)
      assert_equal 5, parsed_logs.size
    end

    def test_max_ip
      logs = [
        "2025-03-06T12:00:00Z, 192.168.1.1, 200",
        "2025-03-06T12:00:05Z, 192.168.1.2, 404",
        "2025-03-06T12:00:10Z, 192.168.1.1, 500",
        "2025-03-06T12:00:15Z, 192.168.1.3, 200",
        "2025-03-06T12:00:20Z, 192.168.1.2, 200",
      ]
      parsed_logs = LogService.parse_logs(logs)
      most_frequent_ip = LogService.most_frequent_ip(parsed_logs)
      assert_equal ["192.168.1.1", "192.168.1.2"], most_frequent_ip
    end

    def test_count_status
      logs = [
        "2025-03-06T12:00:00Z, 192.168.1.1, 200",
        "2025-03-06T12:00:05Z, 192.168.1.2, 404",
        "2025-03-06T12:00:10Z, 192.168.1.1, 500",
        "2025-03-06T12:00:15Z, 192.168.1.3, 200",
        "2025-03-06T12:00:20Z, 192.168.1.2, 200",
      ]
      parsed_logs = LogService.parse_logs(logs)
      status_count = LogService.count_status_codes(parsed_logs)
      assert_equal 3, status_count[200]
      assert_equal 1, status_count[404]
      assert_equal 1, status_count[500]
    end 
end