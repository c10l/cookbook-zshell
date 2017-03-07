actions :enable, :disable
default_action :enable

attribute :user, :kind_of => String,
                 :name_attribute => true,
                 :required => true

attribute :completion_waiting_dots, :kind_of => [ TrueClass, FalseClass ],
                                    :default => true

attribute :use,                     :kind_of => [ Array, String ],
                                    :default => 'oh-my-zsh'

attribute :theme,                   :kind_of => String
attribute :bundle,                  :kind_of => [ Array, String ]

attribute :antigen_url,             :kind_of => String,
                                    :default => 'https://cdn.rawgit.com/zsh-users/antigen/latest/bin/antigen.zsh'

attribute :zgen_load,               :kind_of => [ Array, String ]

attribute :zgen_revision,           :kind_of => String,
                                    :default => 'master'
