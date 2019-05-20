require 'sinatra'

Dir.chdir "cyamonide-me"

post '/payload' do
    puts "Received payload."
    puts "Pulling..."
    `git pull`
    puts "Building..."
    `ng build --prod`
    puts "Removing old files..."
    `rm -rf /var/www/html/*`
    puts "Copying new files..."
    `cp -r dist/cyamonide-me/* /var/www/html`
    puts "All done!"
end
