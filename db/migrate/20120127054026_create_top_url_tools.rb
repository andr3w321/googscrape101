class CreateTopUrlTools < ActiveRecord::Migration
  def change
    create_table :top_url_tools do |t|
      t.string :title

      t.timestamps
    end
  end
end
