# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    association :page, :factory => :page
    body 'Testing'
  end
end
