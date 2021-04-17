---
title: Deploy Laravel su qualsiasi server Ubuntu
---
# Deploy AWS laravel (o su un qualsiasi web server linux)

Questa guida è in realtà un aggregato di più risorse con diversi bug e incompatibilità.

# Stack utilizzato

- Laravel Framework 8.32.1
- Debian 10
- MariaDB
- Nginx
- Docker version 20.10.5, build 55c4c88

Su Debian abbiamo istallato nginx, ci sono tantissime guide per istallarlo una di queste è: 

[https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-debian-10](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-debian-10)

 

# Istallare Docker

Su Debian 10 dobbiamo istallare Docker. Possiamo fare riferimento alla documentazione ufficiale di Docker:

[https://docs.docker.com/engine/install/debian/](https://docs.docker.com/engine/install/debian/)

Tuttavia potremmo riscontrare problemi nellístallazione di docker-ce poiché dipende da containerd.io che dipende da libseccomp2

In questo caso il pacchetto va istallato manualmente secondo la versione specificata dall'errore mostrato in consolle al momento dell'istallazione di Docker

Libseccomp 2 è scaricabile da qui: [https://packages.debian.org/buster/libseccomp2](https://packages.debian.org/buster/libseccomp2)

Poi possiamo trasferire il file .deb tramite SFTP sul server e istallarlo con questo comando `sudo dpkg -i package_file.deb`  dove `pakage_file` va sostituito con path e nome del file scaricato

# Creazione file necessari

Spostiamoci in locale e creiamo i file necessari al deploy

## Creazione di docker-compose.yml

Nella directory principale del progetto creiamo un file chiamato `docker-compose.yml`

Lo script completo del file è questo

```docker
version: '3'
services:

  #PHP Service
  app:
    build:
      context: .
      dockerfile: Dockerfile
    image: digitalocean.com/php
    container_name: app
    restart: unless-stopped
    tty: true
    environment:
      SERVICE_NAME: app
      SERVICE_TAGS: dev
    working_dir: /var/www
    volumes:
      - ./:/var/www
      - ./php/local.ini:/usr/local/etc/php/conf.d/local.ini
    networks:
      - app-network

  #Nginx Service
  webserver:
    image: nginx:alpine
    container_name: webserver
    restart: unless-stopped
    tty: true
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./:/var/www
      - ./nginx/conf.d/:/etc/nginx/conf.d/
    networks:
      - app-network

  #MySQL Service
  db:
    image: mysql:5.7.22
    container_name: db
    restart: unless-stopped
    tty: true
    ports:
      - "3306:3306"
    environment:
      MYSQL_DATABASE: <db_name>
      MYSQL_ROOT_PASSWORD: <db_password>
      SERVICE_TAGS: dev
      SERVICE_NAME: mysql
    volumes:
      - dbdata:/var/lib/mysql/
      - ./mysql/my.cnf:/etc/mysql/my.cnf
    networks:
      - app-network

#Docker Networks
networks:
  app-network:
    driver: bridge
#Volumes
volumes:
  dbdata:
    driver: local
```

Lo script è diviso in diverse parti

### PHP

- `image`  specifica l'immagine di docker da utilizzare nel container, in questo caso quella di digitaocean che ha quello che ci serve per la build di laravel
- `working-dir` sarà la directory del container in cui si trova la nosra build

### Webserver

- `image` ci dice quale immagine di nginx andremo ad utilizzare
- `ports` serve per mappare le porte del nostro server sulle porte del container

### Mysql

- `image` ci dice l'mmagine di mysql da utilizzare
- `ports` come prima serve a mappare la porta del server su quella del container
- `environment` ci permette di settare il nome del nostro db e la password. Importante: non utilizzare numeri o caratteri speciali o docker darà errore

Notiamo che in tutti è stata definita una propriet`chiamata `network` che poi viene specificata in fondo al file. I tre container sono connessi ad un bridge network per comunicare tra di loro. Container che si trovano in network diversi non possono comunicare tra loro e questo rende più sicura l'app. Infatti potremmo mettere i container del frontend su un network diverso. Attenzione: ciò non significa che il frontend non possa fare chiamate API al backend.

## Creiamo il Dockerfile

Sempre nella directory principale creiamo un file chiamato `Dockerfile`

```docker
FROM php:8.0-fpm

# Copy composer.lock and composer.json
COPY composer.lock composer.json /var/www/

# Set working directory
WORKDIR /var/www

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install extensions
RUN docker-php-ext-install pdo_mysql exif pcntl
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install gd

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add user for laravel application
RUN groupadd -g 1000 www
RUN useradd -u 1000 -ms /bin/bash -g www www

# Copy existing application directory contents
COPY . /var/www

# Copy existing application directory permissions
COPY --chown=www:www . /var/www

# Change current user to www
USER www

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]
```

Questo file serve per istallare tutte le dependency utili a Laravel ed esporre la porta su cui girerà la nostra applicazione ossia la 9000.

**ATTENZIONE: La versione di php specificata deve essere quella richiesta dal progetto. Controllate sul file** `composer.json` **quale versione viene richiesta.**

## Creazione php.ini

Nella directory principale creiamo una cartella chiamata `php` e all'interno un file chiamato`local.ini` con la seguente configurazione:

```php
upload_max_filesize=40M
post_max_size=40M
```

Questa è solo la configurazione base che impone il limie all'upload dei file a 40 mb ma possiamo aggiungere qualsiasi qualsiasi altra variabile alla configurazione.

## Configurazione nginx

 Nella directory principale creiamo una cartella chiamata `nginx` e all'interno una cartella chiamata `conf.d`  all'interno di quest'ultima creiamo un file chiamato `app.conf` con il seguente script

```php
server {
    listen 80;
    index index.php index.html;
    error_log  /var/log/nginx/error.log;
    access_log /var/log/nginx/access.log;
    root /var/www/public;
    location ~ \.php$ {
        try_files $uri =404;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass app:9000;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param PATH_INFO $fastcgi_path_info;
    }
    location / {
        try_files $uri $uri/ /index.php?$query_string;
        gzip_static on;
    }
}
```

il blocco php ci dice che l'app si connetterà a tcp sulla porta 9000

## Configurazione mysql

Creiamo nella directory del progetto una cartella chiamata `mysql` e successivamente un file nella directory chiamato `my.cn` con il seguente script

```sql
[mysqld]
general_log = 1
general_log_file = /var/lib/mysql/general.log
```

Questo file serve a permetterci di generare dei log su un file che verrà creato quando necessario 

Possiamo anche estendere la configurazione successivamente

# Configuriamo il file .env

Spostiamoci nel file `.env` nella sezione database quì dovremo specificare alcuni parametri 

```sql
DB_CONNECTION=mysql
DB_HOST=db
DB_PORT=3306
DB_DATABASE=<db_name>
DB_USERNAME=<db_user>
DB_PASSWORD=<db_password>

```

**il nome del database e la password devono essere gli stessi del file dockercompose creato prima**

# Clonare la repo nel nostro server

Accediamo tramite ssh al nostro server . Possiamo usare direttamente il nostro terminale per accedere tramite ssh o un qualsiasi altro programma (putty o termius). In caso di deploy su AWS dobbiamo tenere con noi la chiave .ppk che abbiamo creato quando abbiamo avviato l'istanza dalla consolle di ec2.

Nella root folder cloniamo la repo da gitlab, github, bitbucket... 

# Build con docker

Dal terminale spostiamoci nella cartella appena clonata 

eseguiamo il comando `docker-compose up -d` 

Al termine della build tramite `docker ps` possiamo vedere i nostri 3 container ossia app, webserver e db con relative porte

Generiamo le chiavi della nostra app con il comando `docker-compose exec app php artisan key:generate` 

Poi configuriamo una cache con il comando `docker-compose exec app php artisan config:cache`

# Creazione utente per il db

Precedentemente nel file .env abbiamo specificato l'utente per il db. Ora dobbiamo crearlo.

Sempre dalla consolle eseguiamo `docker-compose exec db bash` poi `mysql -u root -p`

Inseriamo la stessa password che abbiamo messo nel file `.env`

Ora creiamo un nuovo utente con il comando:

`GRANT ALL ON <db_user>.* TO '<username>'@'%' IDENTIFIED BY '<password>';`

Username e password devono essere gli stessi del file .env

Ora aggiorniamo i privilegi con il comenado `FLUSH PRIVILEGES;` e usciamo da mysql con il comando `EXIT;`

usciamo anche dalla bsh consolle con il comando `exit`

# Migrazione tabelle

Ora migriamo le tabelle nel db con il comando `docker-compose exec app php artisan migrate`

Se stiamo usando passport per l'authentication dovremo anche eseguire `docker-compose exec app php artisan php artisan passport:install`

# Note finali

Ogni volta che facciamo il deploy gli unici step da eseguire saranno la pull del repository sul server la build e lo step per la migration. Per eseguire la pull da gitlab potrebbe essere necessario ottenere delle ssh keys. In caso riferirsi a:

[https://docs.gitlab.com/ee/ssh/](https://docs.gitlab.com/ee/ssh/)
