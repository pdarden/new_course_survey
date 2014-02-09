# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :survey do
    json_input "MyText"
    json_output "MyText"
  end
end
