class AddAdminToCitizens < ActiveRecord::Migration
  def change
    add_column :citizens, :admin, :boolean, default: false
  end
end

