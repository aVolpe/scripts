class Timetrap::Formatters::Notes
  def initialize(entries)
    @entries = entries
  end

  def format_seconds secs
    negative = secs < 0
    secs = secs.abs
    formatted = "%s:%02d" % [secs/3600, (secs%3600)/60]
    formatted = "-#{formatted}" if negative
    formatted
  end

  def output
    toRet = @entries
      .select{ |entry| entry[:end] == nil }
      .map{ |entry| "#{entry[:note][0,8]} (#{format_seconds(entry.duration)})" }
      .join(",")

    if toRet.empty?
      puts 'No entries'
    else
      puts toRet
    end
  end
end
