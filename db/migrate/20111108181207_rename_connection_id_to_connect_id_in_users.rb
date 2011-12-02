class RenameConnectionIdToConnectIdInUsers < ActiveRecord::Migration
  def up
    rename_column :connections, :connection_id, :connect_id
  end

  def down
    rename_column :connections, :connect_id, :connection_id
  end
end
