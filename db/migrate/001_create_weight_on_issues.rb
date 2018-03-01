class CreateWeightOnIssues < ActiveRecord::Migration
  def self.up
    create_table :weight_on_issues do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.references :issue, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :weight_val
    end
    //add_index :weight_on_issues, [:issue_id, :user_id], unique: true
  end
  
  def self.down
    ActiveRecord::Base.connection.table_exists? 'weight_on_issues'
    drop_table :weight_on_issues
  end
end
