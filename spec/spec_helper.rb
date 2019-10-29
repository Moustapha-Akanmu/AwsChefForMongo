require 'chefspec'
require 'chefspec/policyfile'
 #finding test coverage
 at_exit { ChefSpec::Coverage.report! }
