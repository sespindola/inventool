class Server < ActiveRecord::Base
  belongs_to :account
  belongs_to :room
  belongs_to :site
  has_many :addresses
end
