namespace :db do
  desc "Erase and fill de db"
  task populate: :environment do
    require 'faker'

    Rake::Task['db:reset'].invoke

    120.times do
      Brevi.create do |brevi|
        brevi.original_url = Faker::Internet.url
      end
    end
    end
end