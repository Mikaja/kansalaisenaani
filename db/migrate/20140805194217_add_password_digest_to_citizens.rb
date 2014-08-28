class AddPasswordDigestToCitizens < ActiveRecord::Migration
  
def change
    
add_column :citizens, :password_digest, :string
  
end

end
