git clone https://gitlab.com/peou/web-midterm-y4s1-backend.git
cd web-midterm-y4s1-backend
composer install
php artisan serve
if Error
#composer update --ignore-platform-req=ext-zip

# Env
Create .env and copy from .env.example

# Run Database in 

# Option 2
# clone project
git clone https://gitlab.com/peou/web-midterm-y4s1-backend.git
cd web-midterm-y4s1-backend

# Creaate Env
cp .env.example .env

# Build & up docker
docker-compose up -d --build

# Install composer
docker exec -it web_midterm_y4_s1_backend_php bash
composer update --ignore-platform-req=ext-zip
php artisan migrate

# Grand Stroage Permission
chmod -R 777 storage

# Run Database
database/my_first_app_db.sql
