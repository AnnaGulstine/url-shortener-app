class AddVisitCountToLinks < ActiveRecord::Migration
  def change
    add_column :links, :visit_count, :integer
  end
end
