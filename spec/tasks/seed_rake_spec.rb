require 'rails_helper'
require 'rake'

xdescribe 'to seed rake task' do 

  before :all do 
    Rake.application.rake_require "tasks/seed"
    Rake::Task.define_task(:environment)
  end  
end 