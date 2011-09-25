class CreateCannedResponses < ActiveRecord::Migration
  def self.up
    create_table :canned_responses do |t|
      t.string :title, :null => false
      t.text   :text, :null => false
      t.references :project
#      t.timestamps
    end
  end

  def self.down
    drop_table :canned_responses
  end
end
