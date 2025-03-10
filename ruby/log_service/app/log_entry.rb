require 'time'
require 'ipaddr'

class LogEntry
  attr_reader :timestamp, :ip_address, :status_code, :raw_log

  def initialize(raw_log) 
    @raw_log = raw_log
    @timestamp, @ip_address, @status_code = raw_log.split(',').map(&:strip)
    @status_code = @status_code.to_i
    @timestamp = Time.parse(@timestamp)
    @ip_address = IPAddr.new(@ip_address)
    freeze
  end
end