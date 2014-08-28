class CreateElections < ActiveRecord::Migration
   

def change
    

create_table :elections do |t|
      
t.integer :total_votes
      
t.integer :in_favor
      
t.integer :against
      
t.string :vote
      
t.references :article, index: true

      
t.timestamps
    
end
  
end

end
