def parse(purpose, pid)
  return {} if purpose.nil?
  purposes = {}

  node_id = $id
  name = purpose['name']

  if purpose['children']
    purpose['children'].each do |_, value|
      $id += 1
      purposes.merge!(parse(value, node_id))
    end
  end

  le_hash = { 'id' => node_id, 'name' => name }
  le_hash['parent_id'] = pid unless pid.nil?

  purposes.merge!(name => le_hash)

  return purposes
end

require 'yaml'
tree = YAML.load_file('purposes.seed')

purposes = {}

$id = 0
tree.each do |_, node|
  $id += 1
  purposes.merge!(parse(node, nil))
end

purposes = purposes.sort_by { |key, value| value['id'] }.to_h

File.open('purposes.yml', 'w') { |f| f.write purposes.to_yaml }
