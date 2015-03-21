actions :create, :delete
default_action :create

attribute :filename, :kind_of => String,
                     :name_attribute => true,
                     :required => true

attribute :user,      :kind_of => String, :required => true
attribute :order,     :kind_of => String, :regex => /^[0-9]{2}$/, :default => '50'

attribute :content,   :kind_of => String

attribute :source,    :kind_of => String
attribute :cookbook,  :kind_of => String
attribute :variables, :kind_of => Hash
