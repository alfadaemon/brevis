namespace :db do
  desc "Erase and fill de db"
  task populate: :environment do
    require 'faker'

    if :environment != 'production'
      Rake::Task['db:reset'].invoke
    end

    150.times do
      Brevi.create do |brevi|
        brevi.original_url = Faker::Internet.url
        brevi.clicks = [*1..1000].sample
      end
    end
    end
end