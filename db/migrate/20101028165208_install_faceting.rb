class InstallFaceting < ActiveRecord::Migration
  def self.up
    # Depending on your database state:
    # execute "CREATE LANGUAGE plpgsql"
    load_faceting
  end

  def self.down
    unload_faceting
  end
end
