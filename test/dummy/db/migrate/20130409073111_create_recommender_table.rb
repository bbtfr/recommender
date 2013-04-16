class CreateRecommenderTable < ActiveRecord::Migration
  def change
    create_table :recommender_recommends do |t|
      t.string :title
      t.string :dynamic_fields

      t.timestamps
    end

    create_table :recommender_products do |t|
      t.belongs_to :recommend
      t.belongs_to :product
      t.string :dynamic_attributes

      t.timestamps
    end

    create_table :recommender_resources do |t|
      t.belongs_to :recommend
      t.belongs_to :resource
      t.string :dynamic_attributes

      t.timestamps
    end
  end
end
