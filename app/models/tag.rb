class Tag < ActiveRecord::Base
  attr_accessible :domain_id, :status_id
  
########Relationships####################

  belongs_to :domain
  belongs_to :status

########Relationships####################

  
end
