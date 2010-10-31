class AddCitizens < ActiveRecord::Migration
  def self.up
    
    create_table :citizens do |t|
    	t.text     :first_name, :null => false
    	t.text     :last_name
    	t.text     :gender
    	t.text     :occupation
      t.text     :birth_city
      t.text     :birth_state
    	t.datetime :birthdate
    	t.text     :social_security
    	
    	t.column   "_fulltext", :tsvector
    end
    
  end

  def self.down
    drop_table :citizens
  end
end
