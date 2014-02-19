require 'pathname'

namespace :db do
  namespace :faceting do
    namespace :signature do
      
      desc "Build and install PostgreSQL C-level faceting API ('signature' data type)"
      task :build do
        system "cd #{Repertoire::Faceting::MODULE_PATH}/ext/signature; make; sudo make install"
      end
      
    end
  end
end