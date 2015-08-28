class AddContactInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :status, :boolean
    add_column :users, :responsibilities, :text, array:true, default: []
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :state, :string
    add_column :users, :zip, :string
    add_column :users, :phone1, :string
    add_column :users, :phone2, :string
    add_column :users, :license, :string
    add_column :users, :designations, :text, array:true, default: []
    add_column :users, :email_pref, :string
  end
end
