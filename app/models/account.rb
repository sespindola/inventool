class Account < ActiveRecord::Base
  has_many :sites
  has_many :servers
end
