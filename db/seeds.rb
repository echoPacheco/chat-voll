# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

User.delete_all

User.create!(name: "Mateus", email: "mateus@gmail.com", password: "123123", password_confirmation: "123123")
User.create!(name: "Pacheco", email: "pacheco@gmail.com", password: "123123", password_confirmation: "123123")
User.create!(name: "João", email: "joao@gmail.com", password: "123123", password_confirmation: "123123")