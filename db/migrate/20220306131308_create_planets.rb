# frozen_string_literal: true

class CreatePlanets < ActiveRecord::Migration[7.0]
  def change
    create_table :planets do |t|
      t.string :name, null: false, default: ''
      t.decimal :mass, null: false, default: 0
      t.decimal :distance_from_star, null: false, default: 0
      t.decimal :orbital_period, null: false, default: 0
      t.integer :category, null: false, default: 0
      t.boolean :tidally_locked, null: false, default: false

      t.references :star, null: false, foreign_key: true

      t.timestamps

      t.index %i[name star_id], unique: true
    end
  end
end
