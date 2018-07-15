require 'net/http'

puts 'type | success | time | total time'
time = Time.now
current_time = time
50.times do
  id = rand(1..10_000)
  endpoint = rand(1..100) > 50 ? 'heart_rate_logs' : 'steps'
  url = "http://purls.slackernews.de/api/users/#{id}/#{endpoint}/purpose/1k6eveFmIynMO8Di7GKIUVEGY2IpqRtX"

  endpoint_shorthand = if endpoint == 'heart_rate_logs'
                         'heart'
                       else
                         'steps'
                       end

  uri = URI(url)
  res = Net::HTTP.get_response(uri).is_a?(Net::HTTPSuccess) ? 'success' : 'failure'
  puts "#{endpoint_shorthand}, #{res}, #{(Time.now - current_time).round(2)}s, total: #{(Time.now - time).round(2)}s"
  current_time = Time.now
end
