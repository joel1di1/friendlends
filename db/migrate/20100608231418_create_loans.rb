class CreateLoans < ActiveRecord::Migration
  def self.up
    create_table :loans do |t|
      t.string :desc
      t.date :start_date
      t.date :return_date
      t.string :borrower

      t.timestamps
    end
  end

  def self.down
    drop_table :loans
  end
end
