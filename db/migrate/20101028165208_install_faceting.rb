class InstallFaceting < ActiveRecord::Migration
  def self.up
    # Depending on your database state:
    # execute "CREATE LANGUAGE plpgsql"
    load_signature_facets
  end

  def self.down
    unload_signature_facets
  end
end
