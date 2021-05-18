How to get this stuff working: 

Host an SQL server with the .sql information included in this repository. Give it an import. Edit the .env settings to suit your environment. In my case I just booted up an XAMPP instance because I'm spread way to thin nowadays. 

go to the directory of the project

composer install
npm install
npm run prod

Windows: copy .env.example .env
Mac:     cp .env.example .env

Should be up and running!

If none of these things work as intended panic! Then google the issue! 