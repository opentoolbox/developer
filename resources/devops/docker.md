---
title: Docker
subtitle: Deploy tool basato sui container.
image: https://www.simoncode.net/wp-content/uploads/2019/04/Risultati-immagini-per-docker.png
hero_image: https://wallpaperaccess.com/full/2982385.png
hero_link: https://www.docker.com/
hero_link_text: Vai al sito
---

# Docker

# Introduzione

Docker è un tool per lo sviluppo e il deploy basato sull'arcitettura a container.

**Che vuol dire?**

In una web app molto complessa è possibile che ci siano più parti che interagiscono fra di loro (backend, frontend, database...), Docker crea una **macchina virtuale** detta **container** per ciascuna di queste parti rendendo lo sviluppo indipendente dall'architettura locale. (in pratica non potrai più dire "si ma sul mio computer funziona😂") 

### **Come comunicano i containers fra di loro?**

Docker crea un network fra i vari container in modo che le comunicazioni interne non possano essere viste da chi per esempio accede all'api che abbiamo costruito

**Come fa Docker a capire quali container inizializzare prima a seconda delle dipendenze?**

È possibile che alcuni container dipendano l'uno dall'altro,  (il backend non può partire se non c'`e un db a cui collegarsi) Per questo viene creato un file chiamato `docker-compose.yml` Questo file specifica a docker tutte le informazioni riguardo ai vari container, le loro dipendenze e le informazioni sul network con cui comunicano.

### **Come faccio poi a far partire tutto?**

Una volta installato Docker e creato `un docker-compose.yml` docrai anche creare i vari `Dockerfile` in ciascun **servizio** della tua web app (quindi se ci sono backend e frontend uno per il backend e uno per il frontend). Questi **dockerfile** contengono le operazioni di **setup** che deve svolgere docker per creare i container: per esempio se il tuo backend è in node dovrai scaricar un'immagine di node e far partire il comando npm install)

Dopodiché basera buildare con `docker-compose build <container>`

e lanciare con `docker-compose up -d <container>`

Purtoppo Docker è un po'più complicato di così. Ti lasciamo un po di docs in cui guardare:

- [Installare Docker](https://docs.docker.com/docker-for-windows/install/)
- [Installare docker-compose](https://docs.docker.com/compose/install/)
