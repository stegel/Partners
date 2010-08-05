namespace :radiant do
  namespace :extensions do
    namespace :partners do
      
      desc "Runs the migration of the Partners extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          PartnersExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          PartnersExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Partners to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from PartnersExtension"
        Dir[PartnersExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(PartnersExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory, :verbose => false
          cp file, RAILS_ROOT + path, :verbose => false
        end
      end  
    end
  end
end
