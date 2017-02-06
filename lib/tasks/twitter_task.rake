require 'eventmachine'
require 'fiber'

namespace :twitter_task do
	task :tweets_task => :environment do
		$client = Twitter::Streaming::Client.new do |config|
		  config.consumer_key        = "XR4F8t3fcqWC1Xh7hrnYFnPmk"
		  config.consumer_secret     = "yL6ov3kPXRUfN6WppII3pELb5e97JNh4vASYEXOkEAraLPiPM6"
		  config.access_token        = "2399912432-g2skLb70KkRMJK5ocG8IyXfcQ3r69vZBVqIBGEG"
		  config.access_token_secret = "wtEmRak8SGa3JNQkByNruLP04j2m8heuZSc9L9C9N1ERc"
		end

		EventMachine.run do #using eventmachine on tweet insert
			i = 0
		    @tweet_fibers = [Fiber.current]
		    $client.filter(locations: "-122.75,36.8,-121.75,37.8") do |tweet|
		    @tweet_fibers << Proc.new { 
		        unless tweet['geo'].nil?
				    Storing.create(
					logitude: tweet['geo']['coordinates'][0],
					latitude: tweet['geo']['coordinates'][1],
					message: tweet['text'],
					user_name: tweet['user']['screen_name']
					)
				end
			}
		    @tweet_fibers.last.call

		    end
		end
	end
end
