---
title: Vue
image: https://miro.medium.com/max/2560/1*Ht8T-vqbqy5iG7FzNQGjFA.png
hero_image: https://miro.medium.com/max/2560/1*Ht8T-vqbqy5iG7FzNQGjFA.png
hero_link: https://vuejs.org/
hero_link_text: Vai al sito
---

# Introduzione

**Vue.js** è un potente framework per la realizzazione di applicazioni frontend. Come altri framework sul mercato, ti consente di scomporre la tua applicazione in componenti, ognuno con una propria logica, stato, stile e markup.

# Componenti

La documentazione ufficiale si sofferma molto sulla creazione di componenti tramite un normale script eseguito direttamente dal browser, tuttavia il modo che secondo noi è più comodo è quello di utilizzare i **Single-File Components**.

Le funzionalità sono le stesse ma la sintassi è molto più pulita e leggibile.

## Struttura di un Single-File Component

In questo componente menzioneremo tutti gli **aspetti fondamentali** per creare un componente, seppur minimale.

```vue
<template>
	<!-- Ricorda: i componenti devono partire da un singolo elemento HTML -->
	<div>
        <!-- Posso decidere se mostrare o no qualcosa basandomi su una condizione -->
        <h1 v-if="titolo != undefined">{{titolo}} (lunghezza = {{ lunghezzaTitolo }})</h1>
        <p v-else>Nessun titolo definito</p>
        
        <p>Questo è il mio componente.</p>
        
        <p>Il valore corrente è {{qualcheValore}}</p>
    </div>
</template>

<script>
    // Al momento ci troviamo in "Componente.vue"
    import qualcosa from "pacchetto"
    import AltroComponente from "./AltroComponente.vue"
    
    // Qui inizia la definizione vera e propria del componente
    // Tutte le variabili sono reattive (mostrano i cambiamenti in tempo reale)
    export default {
       // Le props sono attributi HTML che vengono passati dall'esterno
        props: {
            titolo: {
                type: String,
                default: "Questo è il titolo"
            }
        },
        // Se vogliamo utilizzare un componente va prima registrato qui
        components: {
            AltroComponente
        },
        // Questo rappresenta
        data() {
            return {
                qualcheValore: 0
            }
        },
        // Queste prorpietà sono viste come normali variabili ma sono in realtà il risultato di funzioni
        computed: {
            lunghezzaTitolo(){
                return titolo.length;
            }
        }
    }
</script>

<style scoped>
    /**
    	Il CSS scritto qui sarà valido solo per quesco componente,
    	se si desidera renderlo globale rimuovere "scoped" (sconsigliato).
    */
    h1 {
        color: green;
    }
</style>
```

### Altri concetti importanti

- [Watchers](https://vuejs.org/v2/guide/computed.html#Watchers)
- [Binding di classi e stili](https://vuejs.org/v2/guide/class-and-style.html)
- [Stampa iterativa](https://vuejs.org/v2/guide/list.html)
- [Eventi](https://vuejs.org/v2/guide/events.html)
- [Slots](https://vuejs.org/v2/guide/components-slots.html)

... e molto altro, ma per quello ci sta la documentazione!



# Librerie

## [Vuesax](https://vuesax.com/)

Componenti pronti di alta qualità, dai alla tua app un look moderno senza configurazione!

## [Nuxt](https://nuxtjs.org/)

Il modo definitivo di utilizzare Vue per applicazioni di larga scala, crea applicazioni complesse in pochi minuti!

## [Vuex](https://vuex.vuejs.org/)

Libreria ufficiale per costruire uno *store*, ovvero una memoria dell'applicazione condivisa da tutti i tuoi componenti!