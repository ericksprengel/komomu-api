FactoryGirl.define do

  factory :user do
    name {Forgery(:name).full_name}
    sequence(:email){ |n| "#{Forgery(:internet).user_name}#{n}@example.com"}
    
    factory :user_invalid do
      email "teste"
    end
  end
  
  factory :community do
    name {Forgery(:name).company_name}
    image "http://komomu.com/res/selo.png"
  end

end
