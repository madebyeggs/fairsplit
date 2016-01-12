class CreateSocialsconts < ActiveRecord::Migration
  def change
    create_table :socialsconts do |t|
      t.string :name
      t.timestamps
    end
  end
end
