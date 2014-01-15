require 'active_support'

module Sort
  extend ActiveSupport::Autoload

  autoload :Bubble
  autoload :Selection
  autoload :Insertion
end