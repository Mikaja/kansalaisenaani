class AddIndexToCitizensEmail < ActiveRecord::Migration
  

def change
  
add_index :citizens, :email, unique: true
end


end
