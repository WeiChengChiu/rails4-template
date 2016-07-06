json.sites do
  json.array! @sites do |site|
    json.(site, :id, :name, :host)
  end
end
