class MobilzeGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  
#  argument :layout_name, :type => :string, :default => "application"
  argument :command, :type => :string, :default => nil
  argument :params, :type => :string, :default => ""
  
  class_option :stylesheet, :type => :boolean, :default => true, :desc => "Include stylesheet file."
  class_option :ui, :type => :string, :default => "choclatechip", :desc => "Include http://chocolatechip-ui.com/ UI"
  class_option :command, :type => :string, :default => "", :desc => "layout | model | test | install"

  
  def generate_layout
  
    command = self.command
    if command.nil? 
      puts "HOW TO USE MOBILEZE"
      return
    end
  
    
    if command.include? "install"
      puts "installing Zepto and UI"
      copy_file "mime_types.rb", "configuration/initializers/mime_types.rb" if options.stylesheet?
      return
    end
    
    if command.include? "model"
      puts "CREATING MODEL GOES HERE"
      
      return
    end
    
    if command.include? "layout"
      puts "SETUP THE LAYOUT GOES HERE"
      copy_file "stylesheet.css", "public/stylesheets/#{file_name}.css" if options.stylesheet?
      template "application.mobile.erb", "app/views/layouts/#{file_name}.mobile.erb"
      return
    end
    
    
    puts "HOW TO USE MOBILEZE"
    puts "THIS IS THE MODEL: #{options.model}"
    puts "THIS IS THE Command with params : #{self.command} : #{self.params}"
  
  end
  
  private
  
#  def command
#    self.command
#  end
#  
end
