# Installation Instructions:

`cd file-upload-engine`     
`bundle install`      
`rails db:setup`     
`rails s`     

# Logging in on local development:

As there is not an smtp server set up for local development, when you first sign up it won't send an email with the confirmation link. Instead, you can find the link in the server logs. Simply copy and paste the link into a browser and this will confirm your email address.

# Postgres troubleshooting:

If you are on a mac, installing postgres should be relatively easy. If postgres does not successfully install through the bundle command, you can use:     
`brew install postgres`

On linux, the process is a bit more involved:     
`sudo apt-get install postgresql`

Starting the server on linux:     
`pg_ctl -D /home/linuxbrew/.linuxbrew/var/postgres start`
