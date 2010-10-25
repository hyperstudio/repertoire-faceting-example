class IndexFacets < ActiveRecord::Migration
  def self.up
    # (1) For a one-time index operation (your facets' contents will not change)
    Nobelist.update_indexed_facets([:degree, :discipline])
    Citizen.update_indexed_facets([:gender, :occupation, :birth_place, :birthdate])

    # (2) The simplest way to achieve a periodic facet index update is running a rake
    # task directly via UNIX crontab.  See tasks/facet_indexes.rake for an example.
    
    # (3) If you wish to update facet indices using Repertoire's postgresql-crontab
    # package, send the "silent" option to update_indexed_facets to defer actual indexing
    # and just return SQL:
=begin
    execute <<-SQL
      INSERT INTO crontab(notice, role, task, interval) 
	        VALUES ('Update MyProject facets', NULL, $$ #{ update_indexed_facets(Nobelist, [:degree, :discipline], true) } $$, 
	                '5 minutes');
    SQL
=end
  end

  def self.down
    # For a one-time de-index operation
    Nobelist.update_indexed_facets([])
    Citizen.update_indexed_facets([])
    
    # If using postgresql-crontab, also add:
=begin
    execute <<-SQL
      DELETE FROM crontab WHERE notice = 'Update MyProject facets';
      DROP TABLE IF EXISTS _nobelists_discipline_facet;
    SQL
=end    
    
  end
end