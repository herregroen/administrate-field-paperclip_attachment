require "bundler/gem_tasks"

task :npm do
  sh 'npm install cropper' unless File.exist?('node_modules/cropper/package.json')
end

desc 'Clean the vendor directory'
task :clean do
  Rake.rake_output_message 'Cleaning up the assets directory.'
  FileUtils.rm_rf 'app/assets/javascripts/administrate-field-paperclip_attachment/cropper.min.js'
  FileUtils.rm_rf 'app/assets/stylesheets/administrate-field-paperclip_attachment/cropper.min.css'
end

desc 'Generate the JavaScript assets'
task javascripts: :npm do
  target_dir = 'app/assets/javascripts/administrate-field-paperclip_attachment'
  FileUtils.mkdir_p target_dir
  Rake.rake_output_message 'Generating JavaScripts.'
  FileUtils.cp_r Dir['node_modules/cropper/dist/cropper.min.js'], target_dir
end

desc 'Generate the CSS assets'
task stylesheets: :npm do
  target_dir = 'app/assets/stylesheets/administrate-field-paperclip_attachment'
  mkdir_p target_dir
  Rake.rake_output_message 'Generating stylesheets'
  FileUtils.cp Dir['node_modules/cropper/dist/cropper.min.css'], target_dir
end

desc 'Clean and then generate everything'
task assets: [:clean, :javascripts, :stylesheets]
task default: :assets
