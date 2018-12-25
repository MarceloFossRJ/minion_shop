FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "Minion-#{n}" }
    image Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/factories/files/1.jpg')))
    description "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer turpis risus, mollis vitae odio ac, maximus eleifend velit. Etiam nec metus eget elit porta rhoncus ut id dui. Suspendisse potenti. Etiam eget nibh iaculis dui consequat scelerisque. Curabitur lorem nisl, lacinia sed commodo et, varius ac eros. Ut vel odio sit amet lectus tempor commodo a at arcu. Mauris sed facilisis urna."
  end
end
