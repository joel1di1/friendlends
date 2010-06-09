class LoansOwnedByUser < ActiveRecord::Migration
  def self.up
    add_column :loans, :lender_id, :integer
  end

  def self.down
    remove_column :loans, :lender_id
  end
end
