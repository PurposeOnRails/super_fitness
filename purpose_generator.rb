def parse(purpose, pid)
  return {} if purpose.nil?
  purposes = {}

  id = purpose['id']
  name = purpose['name']

  if purpose['children']
    purpose['children'].each do |_, value|
      purposes.merge!(parse(value, id))
    end
  end

  le_hash = { 'id' => id, 'name' => name }
  le_hash['parent_id'] = pid unless pid.nil?

  purposes.merge!(name => le_hash)

  return purposes
end

require 'yaml'
stuff = YAML.load_file('purposes.seed')

purposes = {}

stuff.each do |key, value|
  purposes.merge!(parse(value, nil))
end

purposes = purposes.sort_by { |key, value| value['id'] }.to_h

File.open('purposes.yml', 'w') { |f| f.write purposes.to_yaml }
