class Status < ActiveRecord::Base
  attr_accessible :name
  
  ########Relationships####################

  has_many :tags

  ########Relationships####################


end
