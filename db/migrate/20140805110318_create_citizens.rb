class CreateCitizens < ActiveRecord::Migration
  

def change
    
	create_table :citizens do |t|
      
		t.string :name
      
		t.string :email

      
		t.timestamps
    
	end
  
end

end
