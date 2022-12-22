class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      with_options null: false do
        t.string :name
        t.string :email
      end

      t.timestamps
    end

    create_table :teams do |t|
      with_options null: false do
        t.string :name
        t.string :email
      end

      t.timestamps
    end

    create_table :stocks do |t|
      with_options null: false do
        t.string :name
        t.string :email
      end

      t.timestamps
    end
  end
end
