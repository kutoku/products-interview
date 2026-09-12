ApplicationRecord.transaction do
  sale = Collection.find_or_create_by!(name: "Sale")
  summer = Collection.find_or_create_by!(name: "Summer")

  {
    "Red shirt" => [ sale ],
    "Blue shirt" => [ summer ],
    "Green shirt" => [ sale, summer ],
    "Black shirt" => []
  }.each do |name, collections|
    product = Product.find_or_create_by!(name: name)
    product.collections = collections
  end
end
