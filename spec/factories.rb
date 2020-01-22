FactoryBot.define do
  factory :game do
    
  end

  factory :piece do
    
  end

  factory :game do
    sequence 
      
  end
end

FactoryBot.define do
  factory :game do
    
  end

  factory :piece do
    
  end

  factory :user do
    sequence :email do |n|
      { "dummyEmail#{n}@gmail.com" }
    end
    password { "secretPassword" }
    password_confirmation { "secretPassword" }
  end
end