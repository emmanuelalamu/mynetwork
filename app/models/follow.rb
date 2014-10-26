class Follow < ActiveRecord::Base
  
  belongs_to :user, foreign_key: "following_id"
end
