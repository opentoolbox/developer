---
title: Svelte
image: https://miro.medium.com/max/2880/1*oHCbzzQSSmDF9icaxCk3iw.jpeg
hero_image: https://i1.wp.com/css-tricks.com/wp-content/uploads/2019/10/svelte-logo-outline.png?fit=1200%2C600&ssl=1
hero_link: https://svelte.dev/
hero_link_text: Vai al sito
---

# Perché Svelte?

La maggior parte dei framework nella scena frontend hanno un grande difetto, ovvero **il peso del bundle finale**. Il motivo per il quale questo peso è così alto è che, oltre al codice scritto dall'utilizzatore, il framework deve iniettare nel risultato finale tutto se stesso per far girare l'applicazione.

Quello che differenzia **Svelte** dalla competizione è il minuscolo *footprint* del codice JavaScript compilato. 

| Framework | Bundle Size | Compressed |
| :-------- | :---------- | :--------- |
| Angular   | 180.3kB     | 62.2kB     |
| Vue       | 63.7kB      | 22.9kB     |
| Preact    | 10.4kB      | 4kB        |
| React     | 6.3kB       | 2.6kB      |
| Svelte    | 3.8kB       | 1.5kB      |

*Source: [Why Svelte is revolutionary](https://dev.to/hanna/why-svelte-is-revolutionary-415e)*

Quando si crea un nuovo progetto con Svelte ci si accorgerà che la sezione `dependencies` del proprio *package.json* è totalmente vuota, questo perché il codice del framework non va incluso nel prodotto finale.

# Componenti

La sintassi dei componenti è molto simile a quella di [Vue.js](vue), vediamo com'è fatta.

```html
<script>
	// logica del componente
</script>

<style>
	/* stile di questo singolo componente */
</style>

<!-- il classico codice HTML va inserito qui, se serve -->
```

Concentriamoci sullo script di un componente, visto che HTML e CSS di sicuro lo conosci se sei qui 😉.

> **Ricorda:** I tag che iniziano con una lettera minuscola (come `<div>`) rappresentano elementi HTML nativi, mentre quelli che iniziano con una lettera maiuscola (come `<Widget>`) rappresentano dei componenti.

## Variabili interne

Per avere delle variabili reattive all'interno del tuo componente devi dichiararle, e non potrebbe essere più semplice.

```html
<script>
	let myValue = 0;
</script>
```

Questo valore può essere poi utilizzato nel markup nella seguente maniera.

```jsx
<p>Il valore corrente è {myValue}</p>
```

Abbiamo appena creato un bind da una variabile ad un elemento HTML, se invece vogliamo fare l'opposto dobbiamo effettuare un *bind inverso*.

```jsx
<input bind:value={myValue} />
```

Questa direttiva aggiornerà la nostra variabile ogni volta che l'input andrà a variare.

Le variabili possono essere utilizzate anche all'interno di attributi.

```jsx
<a href="page/{p}">page {p}</a>
```

Oppure si possono utilizzare delle espressioni per definire il valore di un attributo.

```jsx
<button disabled={someValue >= 0}>...</button>
```

## Variabili esterne

Queste sono le variabili che vengono utilizzate per dare dei valori in input ad un componente, riscriviamo il nostro componente in maniera da fargli ricevere un input da fuori.

```html
<script>
	export let myValue = 0; // in questo caso, 0 è il valore di default in caso non venisse fornito nulla dall'esterno.
</script>
```

Fatto, veloce vero?

Importiamo il nostro componente, che chiameremo *Widget*, e diamo un valore in input alla nostra variabile.

```
<script>
	import Widget from "./Widget";
</script>

<h1> Test per il widget </h1>

<Widget myValue=42 />
```

# Figo vero?

Quello che abbiamo visto è solo un assaggio di come Svelte sia in grado di rendere semplice la costruzione di componenti di un'interfaccia web. Abbiamo appena toccato la punta dell'iceberg, anche gli aspetti più complicati degli altri framework qui sono riassunti con una riga di codice o due, quindi ti invito a continuare.



# [Sapper](https://sapper.svelte.dev)

Vuoi creare applicazioni complesse con Svelte senza configurare manualmente le route? Dividi la tua applicazione in pagine e cartelle con l'aiuto di Sapper.



# [SvelteKit](https://kit.svelte.dev/)

La tua applicazione è davvero grande e complessa? Non sacrificare la velocità e la SEO, sfrutta il Server-Side Rendering, crea delle API, interagisci direttamente con il tuo database e molto altro con SvelteKit!