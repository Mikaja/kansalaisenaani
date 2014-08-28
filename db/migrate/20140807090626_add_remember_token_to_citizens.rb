class AddRememberTokenToCitizens < ActiveRecord::Migration
  

def change
  
    add_column :citizens, :remember_token, :string
    add_index  :citizens, :remember_token

end


end
