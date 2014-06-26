class AddTimestamps < ActiveRecord::Migration
  
  #
  # Under normal circumstances, you would define timestamps in the migration that creates the table.
  #
  # However, older versions of the example application didn't need them. Rather than modify a migration
  # (never a good idea), the change is in a separate migration here.
  #
  
  def up
    add_timestamps(:nobelists)
    add_timestamps(:citizens)
    
    execute "UPDATE nobelists SET created_at = now(), updated_at = now()"
    execute "UPDATE citizens SET created_at = now(), updated_at = now()"
    
    # For very large models, an index on updated_at can speed up cache key calculation
    add_index(:citizens, :updated_at)
  end
  
  def down
    remove_index(:citizens, :updated_at)

    remove_timestamps(:citizens)
    remove_timestamps(:nobelists)
  end
  
end
