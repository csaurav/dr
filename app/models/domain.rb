class Domain < ApplicationModel

  include CustomFileImport

  attr_accessor :file
  attr_accessible :url_name, :rate, :url_date, :file

  ########Validations####################
  validates :url_name, :url_date,  :rate,    :presence => true

  #######Relationships####################

  has_one :tag

  ############Instance Methods#############

  def create_tag(status_id)
    t = Tag.find_by_domain_id self.id
    if t
      t.update_attributes(:status_id => status_id)
    else
      tag = Tag.new(:domain_id => self.id, :status_id => status_id )
      tag.save
    end
  end

  def imported_domains(file)
    @imported_domains ||= load_imported_contents(file)
  end

  def start_file_processing(file)  
    domains = imported_domains(file)
    if domains.map(&:valid?).all?
      domains.each(&:save!)
      true
    else
      errors.add :base, "There are some data errors in the imported file. Please check the file once again."
      false
    end
  end

end
