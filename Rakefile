require 'tailwindcss/ruby'

desc "Run Sinatra server from Ruby"
task :run_ruby do
  ruby "main.rb"
end

desc "Build CSS from Tailwind source"
task :build_css do
  puts "Building CSS..."
  system("#{Tailwindcss::Ruby.executable} --input ./src/styles.css --output ./public/css/application.css")
end

desc "Watch CSS and rebuild on changes"
task :watch_css do
  puts "Watching CSS files..."
  system("#{Tailwindcss::Ruby.executable} -i ./src/styles.css -o ./public/css/application.css --watch")
end

desc "Build minified CSS for production"
task :build_css_production do
  puts "Building minified CSS..."
  system("#{Tailwindcss::Ruby.executable} --input ./src/styles.css --output ./public/css/application.css --minify")
end