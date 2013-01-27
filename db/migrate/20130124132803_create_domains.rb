class CreateDomains < ActiveRecord::Migration
	def change
	  create_table :domains do |t|
	    t.string 	:url_name, :null => false
      t.date    :url_date
	    t.string 	:rate 
	    t.timestamps
	  end
	end	

  # def change
  #   create_table :domains, {:id => false} do |t|
  #     t.string :url_name, :null => false
  #     t.string :price
  #     t.date   :url_date
  #     t.timestamps
  #   end
  #  	execute "ALTER TABLE domains ADD PRIMARY KEY (url_name);"
  # end
end
