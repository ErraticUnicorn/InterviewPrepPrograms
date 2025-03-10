module LogService
  def self.parse_logs(logs)
    return logs.map { |log| LogEntry.new(log) }
  end

  def self.most_frequent_ip(logs)
    ip_count = {}
    logs.each do |log|
      ip = log.ip_address.to_s
      ip_count[ip] ||= 0
      ip_count[ip] += 1
    end

    max_count = ip_count.values.max
    return ip_count.select { |_, count| count == max_count }.keys
  end

  def self.count_status_codes(logs)
    status_count = {}
    logs.each do |log|
      status = log.status_code
      status_count[status] ||= 0
      status_count[status] += 1
    end
    return status_count
  end
end