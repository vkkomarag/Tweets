class UserTweet
  include Mongoid::Document
  field :message, type: String
  field :latitude, type: Float
  field :logitude, type: Float
  field :user_name, type: String

  index({ "latitude" => "2d" })
  index({ "logitude" => "2d" })
end
