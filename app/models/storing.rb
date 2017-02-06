class Storing
  include Mongoid::Document
  field :message, type: String
  field :latitude, type: Float
  field :logitude, type: Float
  field :user_name, type: String
end
