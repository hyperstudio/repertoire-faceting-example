class InstallFaceting < ActiveRecord::Migration

  # For a very basic setup, you could use this to load the API:
  #
  # def self.change
  #   reversible do |dir
  #     dir.up   { execute('CREATE EXTENSION faceting') }
  #     dir.down { execute('DROP EXTENSION faceting CASCADE') }
  #   end
  # end
  #
  #
  # Below is a more sophisticated example that uses different facet APIs on development
  # and production machines. This works well for shared host deployment situations (e.g.
  # in Heroku), where you may not have superuser access to install database extensions.
  #
  # For these use cases, the function faceting_api_sql returns raw sql defining the given
  # API and schema.
  #
  # In the example below the default ("signature") faceting api is used on development &
  # testing databases, and the "bytea" api is used on the production database.
  #
  # You should always place the API in a separate PostgreSQL schema (for now, it must be
  # called 'facet'). The first line of the migration creates this schema.
  #

  def self.up
    if Rails.env.production?
      execute('CREATE SCHEMA facet')
      execute( faceting_api_sql(:varbit, 'facet') )
    else
      execute('CREATE EXTENSION faceting')
    end
  end

  def self.down
    if Rails.env.production?
      execute('DROP SCHEMA facet CASCADE')
    else
      execute('DROP EXTENSION faceting CASCADE')
    end
  end

end
