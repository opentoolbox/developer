---
title: Gitlab
subtitle: CI/CD tool.
image: https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ55dGpVD30l9RYPAokgTZ-6UrEp_J0rZh3RQ&usqp=CAU
hero_image: https://gitlab.frickelstudio.com/uploads/-/system/appearance/logo/1/e1c1da00-gitlab.png
hero_link: https://about.gitlab.com/
hero_link_text: Vai al sito
---
# Gitlab

# Introduzione

GitLab è una piattaforma completa sulla quale effettuare operazioni di DevOps. Può essere semplicemente usata come codebase come GitHub, ma permette anche di costruire delle pipeline (ossia una serie di operazioni) che ci consentono di portare la nostra web app in produzione.

# Getting Started

Per usare gitlab andiamo [qui](https://gitlab.com/users/sign_up) per creare un account. Per poter interagire con qualsiasi repo creata su GitLab avremo bisogno di settare una **shh key**? 

**Si ma cos'è sta roba?**

Una **ssh key** è una coppia di chiavi una pubblica e una privata. Noi deteniamo la chiave privata mentre GitLab ha la chiave pubblica. Ogni volta che vogliamo connetterci al server viene fatto un **controllo sulle chiavi** e se quella pubblica è appaiata correttamente alla privata possiamo connetterci.

Possiamo configurare le chiavi con [questa](https://docs.gitlab.com/ee/ssh/README.html) guida.

## Il tuo primo progetto

È ora di creare il tuo primo **progetto su gitlab**. Vai nella tua dashboard, vai su progetti e clicca su "nuovo progetto". Puoi decidere se iniziare un progetto da un template o completamente vuoto. Dagli un nome poi clicc su crea progetto. Ora puoi clonare il repository vuoto in locale e iniziare a sviluppare

# Continua da qui

- [Basi di git](https://docs.gitlab.com/ee/topics/git/)
- [CI/CD](https://docs.gitlab.com/ee/ci/README.html)
- [Gitlab docs](https://docs.gitlab.com/ee/README.html)


