---
title: Laravel
subtitle: Il framework PHP più completo.
image: https://embed-fastly.wistia.com/deliveries/9c85353a926f914df6d193b126374548.webp?image_crop_resized=1280x720
hero_image: https://laravel.com/img/hero/hero_poster.jpg
hero_link: https://laravel.com
hero_link_text: Vai al sito
---

# Introduzione

Laravel è un framework per creare applicazioni in PHP di qualsiasi livello di complessità. Offre una grande quantità di strumenti per semplificare la vita allo sviluppatore e rimuovere le operazioni ripetitive all'interno di un progetto.

# [Models](https://laravel.com/docs/eloquent): lavorare con database

Il recupero e/o salvataggio dei dati è reso un gioco da ragazzi grazie ai modelli. Ogni modello rappresenta un'entità, un tipo di dato del tuo database.

Facciamo l'esempio con il modello `User` e vediamo alcune delle tante operazioni possibili.
### Selezionare degli utenti

Prendere tutti gli utenti:
```php
$users = User::all();
```

Prendere il nome degli utenti maggiorenni:
```php
$users = User::where('age', '>', 18)->get('name');
```

Trovare un utente specifico tramite chiave primaria:
```php
$user = User::find(12345);
```

### Modificare degli utenti

Qui sotto si vede quanto è semplice recuperare un utente, cambiare delle informazioni e salvare tutto nel database.
```php
$user = User::find(12345);

$user->name = "Mario";

$user->email = "mario.rossi@email.com"

$user->save();
```

# [Controllers](https://laravel.com/docs/controllers): la logica dell'applicazione

I controller sono responsabili per gestire delle richieste. In pratica sono il cuore dell'applicazione, sono loro a chiamare servizi, svolgere operazioni con i modelli, etc.

Prendiamo come esempio un controller per gli utenti:
```php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\User;

class UserController extends Controller
{
    public function show(Request $request)
    {
        return view('user.profile', [
            'user' => User::findOrFail($request->id)
        ]);
    }
}
```

Ogni metodo (pubblico) di un controller rappresenta un'azione che l'utente può compiere, di default ha come argomento un oggetto di dipo `Request`, questo viene iniettato da Laravel, vedremo come tra poco.

Questo `$request` rappresente la richiesta effettuata dall'utente, contiene tutti i valori inviati dal client così come header ed altre info utili (es. quale utente ha effettuato la richiesta con `$request->user()`);

# [Routing](https://laravel.com/docs/routing): gestire i percorsi della tua applicazione

Per completare la configurazione minima ci mancano le _routes_. Queste sono configurazioni che associano un URL ad un certo certo metodo HTTP e metodo di un controller.

```php
Route::get('/user/show', 'UserController@show');
```

Quando l'utente fa una richiesta a quell'URL viene creato l'oggetto di tipo `Request` e viene passato al metodo del controller, il quale viene eseguito ed il suo risultato torna all'utente.


# Continua...
Abbiamo visto solo alcuni dei tanti tool che mette a disposizione Laravel, questi al momento sono il minimo indispensable per creare un'applicazione funzionante.

Qui sotto trovi dei link alla documentazione per approfondire altri concetti di questo bellissimo framework:
- [Autenticazione](https://laravel.com/docs/authentication)
- [Richieste nel dettaglio](https://laravel.com/docs/requests)
- [Validazione delle richieste](https://laravel.com/docs/validation)
- [Middleware](https://laravel.com/docs/middleware)
- [Risposte](https://laravel.com/docs/responses)
- [Views](https://laravel.com/docs/views)
- [Casting dei modelli](https://laravel.com/docs/eloquent-mutators)
- [Migrazioni database](https://laravel.com/docs/migrations) (definizione delle tabelle e delle loro relazioni)

# Micro-framework

Una versione di Laravel ultra-leggera pensate per creare API: [Lumen](https://lumen.laravel.com)

Una versione di Laravel per creare applicazioni CLI: [Laravel Zero](https://laravel-zero.com/) (non ufficiale)