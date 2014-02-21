# Example of a rake task to update facet indices

desc "Update the sample application's facet indices"
task :reindex => :environment do
  ActiveRecord::Base.transaction do
    Nobelist.index_facets([:degree, :discipline])
    Citizen.index_facets([:gender, :occupation, :birth_place, :birthdate])
  end
end
