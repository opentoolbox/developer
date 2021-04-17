---
title: NestJS
subtitle: Applicazioni server-side complesse con Node.
image: https://solidgeargroup.com/wp-content/uploads/2019/12/nest-1.png
hero_image: https://d33wubrfki0l68.cloudfront.net/b48d3f70dffd76bf3152ad04e2cbb1261ef589c9/header.1af6756a.png
hero_link: https://nestjs.com/
hero_link_text: Vai al sito
hero_link_style: is-danger
---

# Introduzione

NestJS è un popolare framework per creare applicazioni server complesse utilizzando Node. La sua caratteristica principale è la semplicità sviluppo, questo framework infatti rimuove tutte le operazioni ripetitive che siamo obbligati a svolgere quando creiamo un nuovo progetto.

# [Controller](https://docs.nestjs.com/controllers): la logica dell'applicazione

I controller sono quelli che si occupano di gestire una richiesta da parte del client.

```typescript
// cats.controller.ts
import { Controller, Get } from '@nestjs/common';

@Controller('cats')
export class CatsController {
  @Get()
  findAll(): string {
    return 'This action returns all cats';
  }
}
```

Quando una richiesta viene effettuata alla nostra applicazione questa viene mandata al controller appropriato, il quale la gestisce e restituisce al client una risposta.

Grazie ai decoratori (es. `@Controller('cats')` e `@Get()`) possiamo definire proprietà utili come l'URL dal quale deve venire la richiesta, quale metodo HTTP va utilizzato e altre proprietà.

Il controller si occupa di interagire con i servizi. Esploriamo questi concetti nel dettaglio.

# [Provider e Servizi](https://docs.nestjs.com/providers) utilizzati dai controller

La maggior parte delle classi che andremo a creare saranno dei _provider_.

Sebbene i nostri controller siano i punti dove riponiamo la logica della nostra applicazione, questi dovrebbero rimanere leggeri, infatti la strategia migliore è delegare la logica più complessa a dei _servizi_ da noi creati, questi, poiché saranno dichiarati come _provider_ verranno messi a disposizione nel controller, pronti per l'utilizzo.

## Come si indica che una classe è un provider?

Creiamo il nostro primo servizio, questo restituisce una lista di gatti (perché si).

```typescript
// cats.service.ts
import { Injectable } from '@nestjs/common';
import { Cat } from './interfaces/cat.interface';

@Injectable()
export class CatsService {
  private readonly cats: Cat[] = [];

  create(cat: Cat) {
    this.cats.push(cat);
  }

  findAll(): Cat[] {
    return this.cats;
  }
}
```

Nota il decoratore `@Injectable()`, grazie a questo indichiamo a NestJS che questa classe può essere _iniettata_ e quindi resa disponibile ad altre classi (ad esempio, può essere richiesta da parte di un controller). Il nostro servizio che restituisce gatti è quindi un _provider_.

L'interfaccia `Cat` definisce semplicemente quali sono le informazioni che vogliamo avere di un determinato gatto.

```typescript
// interfaces/cat.interface.ts
export interface Cat {
  name: string;
  age: number;
  breed: string;
}
```

## Riscriviamo il controller utilizzando il nostro servizio

```typescript
// cats.controller.ts
import { Controller, Get, Post, Body } from '@nestjs/common';
import { CreateCatDto } from './dto/create-cat.dto';
import { CatsService } from './cats.service';
import { Cat } from './interfaces/cat.interface';

@Controller('cats')
export class CatsController {
  constructor(private catsService: CatsService) {}

  @Post()
  async create(@Body() createCatDto: CreateCatDto) {
    this.catsService.create(createCatDto);
  }

  @Get()
  async findAll(): Promise<Cat[]> {
    return this.catsService.findAll();
  }
}
```

Come vedete nel costruttore, il nostro controller chiede di avere `CatsService`, visto che lo abbiamo definito come iniettabile, questo gli viene fornito da NestJS automaticamente.

Da qui, anche se non tocchiamo più il controller, possiamo andare a modificare il servizio e fargli prendere i dati da un database, o da una lista di file... tutto in maniera molto semplice.

# Approfondisci NestJS

Al momento abbiamo visto solamente i concetti base per avere un'applicazione appena funzionante, da qui abbiamo lasciato risorse esterne per impararlo più nel dettaglio.

👉 [Documentazione](https://docs.nestjs.com/)

# Risorse esterne

- [Impara NestJS costruendo un'API](https://coursesity.com/course-detail/learn-nestjs-from-scratch-by-building-an-api) (corso gratuito)
- [Awesome NestJS](https://github.com/juliandavidmr/awesome-nestjs): Lista curata dei migliori progetti realizzati con questo framework.
- [Costruire API RESTful con NestJS](https://medium.com/swlh/building-restful-apis-with-nestjs-getting-started-623453dbf7e0)