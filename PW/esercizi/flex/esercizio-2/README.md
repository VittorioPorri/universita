# 🧩 Esercizio Flexbox #2 - Pagina News Responsive con Menu Hamburger

## 🎯 Obiettivo
Creare una pagina web responsive per un sito di notizie ("News24") con:

- Una testata con logo e menu
- Tre articoli con immagine e testo
- Una barra laterale (`aside`) con pubblicità
- Menu di navigazione orizzontale su desktop, hamburger menu su mobile

---

## 🧱 Struttura della pagina

- `<header>`: contiene logo e menu di navigazione
- `<nav>`: lista di link orizzontale (desktop), hamburger (mobile)
- `<main>`: contiene 3 articoli con immagini da `picsum.photos`
- `<aside>`: contiene una pubblicità in formato immagine

---

## 🎨 Aspetto grafico

- Colori pastello: header blu scuro, articoli bianchi, aside grigio chiaro
- Font sans-serif moderno
- Ombre leggere e bordi arrotondati
- Immagini a inizio articolo (`<img>` con `border-radius`)
- Pubblicità rappresentata con immagine (`https://picsum.photos/id/1050/300/250`)

---

## 📐 Layout con Flexbox

- `.container`: `display: flex` con `gap: 2rem`
- `main` ha `flex: 2`, `aside` ha `flex: 1`
- Articoli verticali, affiancati alla pubblicità

---

## 📲 Responsive Design (Mobile First)

### 🔹 1. **Taglio Mobile** (default)
- Layout a colonna unica (`flex-direction: column`)
- Menu orizzontale nascosto, sostituito da hamburger (`.hamburger { display: block; }`)
- Menu verticale a scomparsa: visibile solo con classe `.show`

### 🔸 2. **Taglio Tablet/Desktop**
```css
@media (min-width: 769px) {
  .container {
    flex-direction: row;
  }

  .hamburger {
    display: none;
  }

  nav ul {
    display: flex !important;
    position: static;
    background: none;
    flex-direction: row;
    width: auto;
    padding: 0;
  }
}