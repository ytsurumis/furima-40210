FactoryBot.define do
  factory :purchase_shipping do
    token          { 'tk000000000000000' }
    post_code      { '111-1111' }
    area_id        { 2 }
    municipalities { '留萌市' }
    street         { '留萌1-1-1' }
    building       { '留萌レジデンス' }
    phone          { '00000000000' }
  end
end
