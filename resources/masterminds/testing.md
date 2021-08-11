---
title: Introduzione al testing
subtitle: con @ludovicobesana
image: https://images.pexels.com/photos/2280549/pexels-photo-2280549.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260
banner_with_image: true
banner_link: https://www.canva.com/design/DAElbWdID7g/fKI_ye-XEfkZwsRnG8Jt8g/view?utm_content=DAElbWdID7g&utm_campaign=designshare&utm_medium=link&utm_source=sharebutton#1
banner_link_text: Guarda la presentazione
---

# Introduzione

Prima di pubblicare un prodotto bisogna assicurarsi che funzioni al meglio.
Naturalmente, se chi prova il prodotto è lo stesso che lo ha creato, molti problemi (anche ovvi) potrebbero sfuggirgli di vista.

> Fare testing non è semplice, devi avere una conoscenza di sviluppo molto ampia per poter realizzare dei test fatti per bene. Non si fa a caso.

Il motivo per il quale abbiamo la figura del tester è proprio perché scrivere dei test automatizzati e stilare rapporti è un processo lungo e delicato, è praticamente un secondo progetto che va sviluppato in parallelo al prodotto vero e proprio.

# Chi è [Ludovico Besana](https://www.ludovicobesana.com/)?

## Lavoro

Lavora nel mondo dello sviluppo e del QA Testing da circa 3 anni, ha gestito numerosi progetti da freelancer per startup ed ha lavorato anche per agenzie. Nel mastermind ci ha detto:

> Passare da sviluppatore a QA Tester mi ha fatto rendere conto di quanto devi conoscere la materia per scrivere test efficaci. Fare test scritti male è peggio che non farli.

## Altri impegni

Oltre al suo lavoro si trova a gestire varie community e progetti open source, la più nota è [Coding Bunker](https://www.codingbunker.it/), una community di sviluppatori su Discord. Oltre alle community è anche un contributore al progetto Pop_OS.

# Figure nel mondo della QA - Non solo tester

Come accennato prima, il QA engineer deve avere competenze in molti settori del processo di sviluppo di un qualsiasi prodotto (sito, app, etc.), quello che capita spesso (anche troppo spesso) è trovare un tester con poche conoscenze rispetto alle tecnologie utilizzate e, quindi, potrebbe trovare un bug e segnalarlo senza capirne la causa.

Ludovico ci racconta:

> A volte è anche capitato di trovare persone che segnalano bug dove non ci sono, semplicemente per ignoranza rispetto al funzionamento di un certo framework, tool o sistema.

# Rapportarsi con gli sviluppatori

Tutti conosciamo quella persona che trova ogni occasione per criticare e trovare problemi, sono quelle persone che vediamo come troppo puntigliose e "pignole", ecco, il tester fa questo di lavoro.

Un aspetto che viene trascurato è il **rapporto tra il tester e gli sviluppatori**:

> Da un lato vuoi segnalare ogni problema che incontri e descriverlo nei suoi minimi dettagli (dove possibile), dall'altro incontrerai resistenza, sia tempi stretti che per riluttanza da parte del programmatore stesso.

*Fortunatamente, trovare programmatori che sacrificano la qualità del progetto per validazione personale non è una cosa comune.*

Qualunque sia il caso, bisogna sempre coltivare un rapporto amichevole mantenendo, però, un tono fermo quando si tratta di segnalare dei bug.

# Non bisogna aspettare

Ogni problema è più facile da risolvere quando si stronca alla radice; lo stesso capita con i bug.

> Man mano che l'applicazione cresce, e sempre più elementi fanno uso di un pezzo di codice contenente un bug, **il costo** (inteso come tempo e risorse) **per risolvere un bug cresce**.

Non bisogna, quindi, finire l'applicazione e POI chiamare un tester, bensì questo va incluso nel progetto fin dall'inizio.

# Tipi di testing e procedure

Finora abbiamo parlato solo di "tester" in maniera generale, tuttavia, questa disciplina si divide in molte sottocategorie, se volete approfondirle andate a vedere [questo articolo](https://www.perfecto.io/resources/types-of-testing) in materia.

## [Manuale VS Automatizzato](https://www.cleveroad.com/blog/manual-vs-automation-testing)

Quando vogliamo simulare il comportamento di un umano che interagisce con il nostro prodotto il modo migliore sarebbe, beh, un umano; questo approccio, tuttavia, ha delle limitazioni.

### Testing manuale

- Dipende da quante persone hai a disposizione
- Errore umano
- Fare tanti test identici di fila risulta quasi impossibile visto che ognuno lo farebbe in modi *leggermente* diversi
- Garantisce una buona UX

### Testing automatizzato

- Puoi eseguire molti test in parallelo
- Risultati accurati
- Tessa procedura ogni volta
- Non garantisce una buona UX (per farla semplice, *i computer non danno opinioni*)

# Automation

Esistono vari strumenti per scrivere ed eseguire test, uno tra i più utilizzati (ed il preferito di Ludovico e molti altri tester professionisti) è **[Robot Framework](/resources/testing/robotframework)**, uno strumento potente e con una sintassi molto semplice (andrai a scrivere delle normali frasi in inglese) in grado di testare la tua applicazione come se fosse un utente umano.

Usato in congiunzione con uno dei suoi numerosi plugin è possibile testare tutto: da un sito ad un app nativa.

Abbiamo più info sulla pagina dedicata.

