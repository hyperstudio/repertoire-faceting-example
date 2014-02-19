require 'pathname'

namespace :db do
  namespace :faceting do
    
    namespace :signature do
      desc "Load the PostgreSQL C-language faceting API extensions into current database"
      task :load => :environment do
        ActiveRecord::Base.connection.load_signature_facets
      end
      
      desc "Drop the PostgreSQL C-language faceting API from the current database"
      task :unload => :environment do
        ActiveRecord::Base.connection.unload_signature_facets
      end
      
    end
    
    namespace :bit do
    
      desc "Load the basic PostgreSQL faceting API into the current database"
      task :load => :environment do
        ActiveRecord::Base.connection.load_bit_facets
      end
      
      desc "Drop the basic PostgreSQL faceting API from the current database"
      task :unload => :environment do
        ActiveRecord::Base.connection.unload_bit_facets
      end
    end
        
  end
end