class Room < ActiveRecord::Base
  belongs_to :site
  has_many :servers
end
