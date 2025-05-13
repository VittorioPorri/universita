# 🧩 Esercizio Flexbox #1 - Layout con Card Orizzontali

## 🎯 Obiettivo dell’esercizio

Creare una pagina web utilizzando **Flexbox** per disporre 3 card **affiancate orizzontalmente** su schermi larghi, e **impilate verticalmente** su dispositivi mobili. Le card devono essere esteticamente uniformi, con immagine, titolo e descrizione.

---

## 🖼️ Descrizione visiva

La pagina presenta:

-   Uno sfondo **grigio chiaro**.
-   Un **contenitore centrale** con 3 card allineate orizzontalmente.
-   Ogni card è un rettangolo **bianco**, con **bordo sottile**, **ombra**, e **angoli arrotondati**.
-   Dentro ogni card:
    -   Un’immagine in cima (300x180)
    -   Un **titolo in grassetto**
    -   Un breve **testo descrittivo**

---

## 📐 Specifiche tecniche

### Layout generale

-   Sfondo grigio chiaro: `#f0f0f0`
-   Contenuto centrato verticalmente e orizzontalmente
-   Margine uniforme tra le card: `gap: 20px`

### Container delle card

-   `display: flex`
-   `justify-content: center`
-   `flex-wrap: wrap` per responsività
-   Margine/padding adeguati

### Card

-   Larghezza: `300px`
-   Bordi: `1px solid #ddd`
-   Angoli arrotondati: `border-radius: 8px`
-   Ombra: `box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1)`
-   Immagine in alto: `width: 100%`
-   Titolo e paragrafo in `padding: 16px`
-   Testo descrittivo in `color: #555`

### Responsive

-   Con media query: su schermi <768px le card vanno **impilate verticalmente**

---

## 🖼️ Immagini da utilizzare

-   `https://picsum.photos/id/20/300/180` – Natura
-   `https://picsum.photos/id/1025/300/180` – Cane
-   `https://picsum.photos/id/1003/300/180` – Paesaggio

---

## 📝 Note o domande

Scrivi qui eventuali dubbi, domande o osservazioni.

---

> **Suggerimento**: Puoi arricchire l’esercizio aggiungendo hover, bottoni, transizioni, oppure trasformare le card in link cliccabili.
