# Example of a rake task to update facet indices

desc "Update the sample application's facet indices"
task :reindex => :environment do
  ActiveRecord::Base.transaction do
    Nobelist.update_indexed_facets([:degree, :discipline])
    Citizen.update_indexed_facets([:gender, :occupation, :birth_place, :birthdate])
  end
end

# Example of rake tasks to load non-standard sql schemas

namespace :db do
  namespace :structure do
    desc "Load the database structure from SQL files"
    task :load => :environment do
      
    
    end
  end
  
  task :bootstrap => [ 'db:create', 'db:structure:load', 'db:seeds:load', 'reindex']
  
  def load_sql(file)
    abcs = ActiveRecord::Base.configurations
    case abcs[Rails.env]["adapter"]
    when "postgresql"
      ENV['PGHOST']     = abcs[Rails.env]["host"]          if abcs[Rails.env]["host"]
      ENV['PGPORT']     = abcs[Rails.env]["port"].to_s     if abcs[Rails.env]["port"]
      ENV['PGPASSWORD'] = abcs[Rails.env]["password"].to_s if abcs[Rails.env]["password"]
      `psql -U "#{abcs[Rails.env]["username"]}" -f db/#{Rails.env}_structure.sql`
      
      `pg_dump -i -U "#{abcs[Rails.env]["username"]}" -s -x -O -f db/#{Rails.env}_structure.sql #{search_path} #{abcs[Rails.env]["database"]}`
      raise "Error dumping database" if $?.exitstatus == 1
    else
      raise "Task not supported by '#{abcs[Rails.env]["adapter"]}'"
    end
  end
end
