class Purpose < ActiveYaml::Base
  include ActiveHash::Associations

  field :id
  field :name

  # a purpose can have many children_purposes (cf. purpose_tree)
  has_many :children, class_name: "Purpose", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Purpose"

  # has_many :access_codes
end
