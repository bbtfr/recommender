json.array!(@products) do |product|
  json.partial! "model", product: product
end