module CustomFileImport
	
	def open_file(file)
  		case File.extname(file.original_filename)
  		when ".txt"	then File.open(file.tempfile, 'r')
  		else raise "Unknow file type: #{file.original_filename}"	
  		end
  	end

	
	def load_imported_contents(file)
		lines = open_file file
		columns = Settings.domain_columns.map(&:column)
		lines.map do |i|
			row = Hash[[columns,i.strip.split(',')].safe_transpose]
			obj = (self.class.find_by_url_name row["#{Settings.domain_columns.first.column}"]) || self.class.new
			obj.attributes = row.to_hash.slice(*self.class.accessible_attributes)
			obj
		end
	end

end




	