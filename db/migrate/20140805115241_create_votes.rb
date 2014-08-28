class CreateVotes < ActiveRecord::Migration
  

def change
    
	create_table :votes do |t|
      
	    t.integer :proposal_id


	    t.references :citizen, index: true

 
	    t.timestamps
    
	end
  
end

end
