ENV['TZ'] = "America/New_York"

require "bundler/setup"
require "almanack/server"

now = Time.now

Almanack.config do |calendar|
  calendar.title = 'Miamisburg Sports Calendar'

  calendar.theme = 'starter'

  if ENV['ICAL_FEEDS']
    ENV['ICAL_FEEDS'].split(' ').each do |feed|
      calendar.add_ical_feed feed
    end
  end
end

run Almanack::Server