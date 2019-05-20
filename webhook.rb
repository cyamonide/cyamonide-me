require 'sinatra'

post '/payload' do
    puts "Received payload."
    puts "Pulling..."
    `git pull`
    puts "Changing dir..."
    Dir.chdir "cyamonide-me"
    puts "Building..."
    `ng build --prod`
    puts "Removing old files..."
    `rm -rf /var/www/html/*`
    puts "Copying new files..."
    `cp -r dist/cyamonide-me/* /var/www/html`
    puts "All done!"
end
