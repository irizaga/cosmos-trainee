# frozen_string_literal: true

class CreateStars < ActiveRecord::Migration[7.0]
  def change
    create_table :stars do |t|
      t.string :name, null: false, default: ''
      t.decimal :mass, null: false, default: 0
      t.integer :category, null: false, default: 0
      t.decimal :distance_from_earth, null: false, default: 0

      t.timestamps

      t.index :name, unique: true
    end
  end
end
