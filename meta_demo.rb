#=========================================================================
#
# Name:     meta_demo.rb
#
# Purpose:  Define a simple class that uses ActiveModel::Validations
#           so WebTools can observe the methods generated by ActiveModel.
#
# WARNING:  Running WebTools is safe, BUT RUNNING meta_demo.rb IS NOT!!!
#           It unsafely persists rubygems, active_model and active_support
#           in a state that will have unintended consequences.  If you
#           run it, you should run "maglev force-reload" afterwards to
#           load an empty database.
#
# Usage:    maglev-ruby -Mcommit meta_demo.rb
#           or
#           rake meta
#
#           Try the following:
#           add :age to both validates_presence_of and attr_accessor,
#           run 'rake meta' again, then click 'Refresh View' in WebTools
#           You'll see new instance methods age and age= on AValidPerson
#
#=========================================================================

require 'rubygems'
require 'active_model'

class AValidPerson
  include ActiveModel::Validations

  validates_presence_of :first_name, :last_name

  attr_accessor :first_name, :last_name
  def initialize(first_name, last_name)
    @first_name, @last_name = first_name, last_name
  end
end
