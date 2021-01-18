FactoryBot.define do
  factory :plan do
    title           { 'Aプラン' }
    client          { 'A株式会社' }
    price           { 100000 }
    client_status_id   { 2 }
    sales_status_id    { 2 }
    memo            { 'テスト' }
    knowledge       { 'テスト' }

    association :user
    
  end
end
