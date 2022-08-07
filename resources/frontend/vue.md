---
title: Vue
image: https://miro.medium.com/max/2560/1*Ht8T-vqbqy5iG7FzNQGjFA.png
banner_image: https://miro.medium.com/max/2560/1*Ht8T-vqbqy5iG7FzNQGjFA.png
banner_link: https://vuejs.org/
banner_link_text: Vai al sito
---

# Introduzione

Vue.js è un framework accessibile, performante e versatile per la creazione di interfacce utente web.

# Componenti

La documentazione ufficiale si sofferma molto sulla creazione di componenti tramite un normale script eseguito direttamente dal browser,
tuttavia sono stati implementati i **Single-File Components** (component.vue) che rendono la creazione di componenti più semplice e veloce.

## Struttura di un Single-File Component

Nel seguente codice menzioneremo tutti gli **aspetti fondamentali** per creare un componente, seppur minimale.

```vue
<!-- i tag template sono la parte di "HTML" -->
<template>
    <div><!-- Ricorda: se si utilizza Vue 2 i componenti devono partire da un singolo elemento HTML-->
        <!-- Posso decidere se mostrare o no qualcosa basandomi su una condizione (v-if="" / v-else) -->
        <h1 v-if="titolo != undefined">{% raw %}{{ titolo }} (lunghezza = {{ lunghezzaTitolo }}{% endraw %})</h1>
        <p v-else>Nessun titolo definito</p>
        
        <p>Questo è il mio componente.</p>
        
        <!-- lo state del contatore si aggiorna automaticamente -->
        <p>Il valore corrente è {% raw %}{{ contatore }}{% endraw %}</p>
        <!-- l'alias @ è equivalente a v-on: (@click="" == v-on:click="") -->
        <button @click="increase()">Aggiungi 1</button>
    </div>
</template>

<!-- i tag script sono la parte di "JavaScript" -->
<script> // aggiungere lang="ts" se si utilizza typescript
    // Importare all'inzio del file eventuali packages o componenti
    import qualcosa from "pacchetto"
    import AltroComponente from "./AltroComponente.vue"
    
    // Tutte le variabili sono 'reattive' (mostrano i cambiamenti in tempo reale)
    export default {
       // Le props sono attributi HTML che vengono passati dall'esterno (dal parent)
        props: {
            titolo: {
                type: String,
                default: "Questo è il titolo"
            }
        },
        // Se si vuole utilizzare un componente va prima registrato qui
        components: {
            AltroComponente
        },
        // In data() { return { ... } } vengono definite tutte le variabili dei dati
        data() {
            return {
                contatore: 1
            }
        },
        // Nella sezione methods saranno presenti tutte le funzioni (metodi)
        methods: {
            increase() {
                this.contatore++ // per accedere a 'contatore' aggiugnere il bind this. alla variabile
            }
        }
        // Queste prorpietà sono viste come normali variabili ma sono in realtà il risultato di funzioni
        computed: {
            lunghezzaTitolo(){
                return titolo.length;
            }
        }
        ... // Tutte le altre proprietà definite nella documentazione ufficiale.
    }
</script>

<!--
    Sezione di styling del componente ( default CSS );  
    è possibile utilizzare preprocessori aggiungendo il metodo lang="".
    esempio <style lang="scss" scoped>
-->
<style scoped>
    /**
    	Il CSS scritto qui sarà valido solo per questo componente,
    	se si desidera renderlo globale rimuovere "scoped" (sconsigliato).
    */
    h1 {
        color: green;
    }
</style>
```
###### Prova Vue 3 sul playground ufficiale: [Vue 3 Playground](https://sfc.vuejs.org)


### Altri concetti importanti

- [Watchers](https://vuejs.org/v2/guide/computed.html#Watchers)
- [Binding di classi e stili](https://vuejs.org/v2/guide/class-and-style.html)
- [Stampa iterativa](https://vuejs.org/v2/guide/list.html)
- [Eventi](https://vuejs.org/v2/guide/events.html)
- [Slots](https://vuejs.org/v2/guide/components-slots.html)

Molto altro nella documentazione: [Vue 2](https://v2.vuejs.org/v2/guide/) - [Vue 3](https://vuejs.org/guide/)

# Integrazioni
- [Vuex](https://vuex.vuejs.org/) - **easy** - Libreria ufficiale per gestire lo *store*, ovvero una memoria dell'applicazione condivisa e accessibile a tutti i componenti
- [Vuefire](https://vuefire.vuejs.org/) - **medium** - Libreria ufficiale per integrare e gestire firebase nella tua web app.

# Librerie di componenti UI
- [Vuesax](https://vuesax.com/) - **easy** - Componenti e animazioni dal look moderno senza bisogno di configurazione.
- [BootstrapVue](https://bootstrap-vue.org/) - **medium** - Affidabilità e qualità di Bootstrap per Vue.js.
- [Vuetify](https://vuetifyjs.com/) - **medium** - Completa e innovativa libreria di UI Components per Vue.js.

## Altro
- [Nuxt](https://nuxtjs.org/) - Il modo definitivo di utilizzare Vue per applicazioni di larga scala, crea applicazioni complesse in pochi minuti
