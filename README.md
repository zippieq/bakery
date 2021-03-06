![the-octo-food](images/banner.jpg)
# TheOctoFood - Django Food Order Website
English | [Tiếng Việt](README-vi.md)

## Deployment Guides

Clone this repo
```
git clone https://github.com/sownt/TheOctoFood.git && cd TheOctoFood
```
You can deploy this project with docker-compose (recommended) or with Python virtual environment.

### 1. Deploy with Docker compose (Recommended)

#### Requirements:
- Docker engine
- docker-compose

You can install [Docker Desktop](https://docs.docker.com/desktop/) for Windows/macOS or install [Engine](https://docs.docker.com/engine/) and [compose](https://docs.docker.com/compose/install/) for Linux.

First, create `.env` file at /src/TheOctoFood/ to set environment variables
```
SECRET_KEY=                                     # Django secret key
DATABASE_ENGINE=django.db.backends.mysql
DATABASE_NAME=theoctofood
DATABASE_USER=                                  # MariaDB/MySQL username
DATABASE_PASSWORD=                              # MariaDB/MySQL password
DATABASE_HOST=                                  # MariaDB/MySQL host
DATABASE_PORT=3306
LANGUAGE_CODE=en-us
TIME_ZONE=Asia/Ho_Chi_Minh
EMAIL_HOST=                                     # SMTP host
EMAIL_HOST_USER=                                # SMTP username
EMAIL_HOST_PASSWORD=                            # SMTP password
EMAIL_PORT=                                     # SMTP port
```
Then run command below and Docker will help you do everything
```
docker-compose up
```

### 2. Deploy with virtual environment

#### Requirements:
- MySQL/MariaDB with theoctofood database created

To create database
```
CREATE DATABASE IF NOT EXISTS `theoctofood` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
```

Create a virtual environment
```
python -m venv .
```
Activate it
```
Scripts\activate.bat    # Windows
source bin/activate     # Linux
```
Install required packages
```
pip install -r requirements.txt
```
Create `.env` file at `/src/TheOctoFood/` to set environment variables
```
SECRET_KEY=                                     # Django secret key
DATABASE_ENGINE=django.db.backends.mysql
DATABASE_NAME=theoctofood
DATABASE_USER=                                  # MariaDB/MySQL username
DATABASE_PASSWORD=                              # MariaDB/MySQL password
DATABASE_HOST=                                  # MariaDB/MySQL host
DATABASE_PORT=3306
LANGUAGE_CODE=en-us
TIME_ZONE=Asia/Ho_Chi_Minh
EMAIL_HOST=                                     # SMTP host
EMAIL_HOST_USER=                                # SMTP username
EMAIL_HOST_PASSWORD=                            # SMTP password
EMAIL_PORT=                                     # SMTP port
```
You can import sample to database with `/src/TheOctoFood/theoctofood.sql` file

Migrate and run
```
python manage.py migrate && python manage.py runserver 0.0.0.0:8000
```