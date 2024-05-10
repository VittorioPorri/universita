##### Sulla console lancio il comando  `nc -c art.uniroma2.it 80` 
- -c chiude la connessione su EOF da stdin
- art.uniroma2.it 80 indica l'host e il numero di porta

scrivere sulla connessione quanto segue:
```
GET / HTTP/1.1
Host: art.uniroma2.it
Connection: close

``` 

>[!note]
>Ricordati che l'ultima riga deve essere vuota 

Si tratta di una richiesta GET per il percorso / (la radice della web root) all’host 
art.uniroma2.it

Si otterrà una risposta simile alla seguente :

```
HTTP/1.1 200 
Server: nginx/1.25.3
Date: Wed, 03 Apr 2024 07:38:38 GMT
Content-Type: text/html;charset=UTF-8
Content-Length: 4674
Connection: close
Set-Cookie: JSESSIONID=6BF5F4C12B5B052CE7469BBB4B098219; Path=/; HttpOnly

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"><head id="j_idt2">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  [Continua fino alla fine del file ...]
```

- La riga di stato ci dice che è una risposta positiva (200)
- la risposta è stata generata dal proxy nginx
- la risposta è stata generata in una determinata data e ora
- i dati restituiti sono in formato HTML codificato usando UTF-8
- i dati restituiti sono lunghi 4673 byte
- Il server ha generato il cookie JSESSIONID=6BF5F4C12B5B052CE7469BBB4B098219

##### Sulla console lancia il comando `nc -c art.uniroma2.it 80`

Scrivere sulla connessione:
```
GET / HTTP/1.1
Host: art.uniroma2.it

```

Si otterrà una risposta simile alla seguente:
```
HTTP/1.1 200 
Server: nginx/1.25.3
Date: Wed, 03 Apr 2024 08:20:38 GMT
Content-Type: text/html;charset=UTF-8
Content-Length: 4674
Connection: keep-alive
Set-Cookie: JSESSIONID=67C8B7ECA630F84D0C8811813B431C24; Path=/; HttpOnly

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"><head id="j_idt2">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  [Continua fino alla fine del file ...]
```

Il comando `nc` dovrebbe essere ancora in esecuzione, in attesa di altre richieste.  Premere `CTRL+D` per farlo uscire

#####  Sulla console lancia il comando `nc -c art.uniroma2.it 80`

Scrivere sulla connessione: 
```
GET / HTTP/1.1
Host: art.uniroma2.it
Connection: close

```

Si otterrà una risposta simile alla seguente:
```
HTTP/1.1 200 
Server: nginx/1.25.3
Date: Wed, 03 Apr 2024 08:37:47 GMT
Content-Type: text/html;charset=UTF-8
Content-Length: 4673
Connection: close
Set-Cookie: JSESSIONID=E8BC321D05E223B0BD3323C778E12464; Path=/; HttpOnly

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"><head id="j_idt2">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
```

Selezionare il cookie generato JSESSIONID=E8BC321D05E223B0BD3323C778E12464

Ora ripetere il comando `nc -c art.uniroma2.it 80` e scrivere sulla connessione:
```
GET / HTTP/1.1
Host: art.uniroma2.it
Cookie: JSESSIONID=E8BC321D05E223B0BD3323C778E12464
Connection: close

```

Si otterà una risposta simile alla seguente: 
```
HTTP/1.1 200 
Server: nginx/1.25.3
Date: Wed, 03 Apr 2024 08:42:13 GMT
Content-Type: text/html;charset=UTF-8
Content-Length: 4629
Connection: close

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"><head id="j_idt2">
[Continua fino alla fine del file ...]
```

Si noti che nella risposta non è stato incluso alcun cookie, perche il server ha usato quello incluso nella richiesta anzichè generarne uno nuovo.

##### Sulla console lancia il comando `nc -c art.uniroma2.it 80 <<EOF`
- <<$EOF$ Permette di inserire input multilinea, il testo fornito inizia dalla riga successiva a <<$EOF$ e contiuna fino a quando non viene raggiunta una riga contenente solo la parorla EOF

Scriviamo sulla connessione:
```
HEAD / HTTP/1.1
Host: art.uniroma2.it

HEAD /fiorelli/ HTTP/1.1
Host: art.uniroma2.it
Connection: close

EOF
```

Si otterrà una risposta simile alla seguente:
```
HTTP/1.1 200
Server: nginx/1.25.3
Date: Tue, 19 Mar 2024 17:31:48 GMT
Content-Type: text/html;charset=UTF-8
Connection: keep-alive
Set-Cookie: JSESSIONID=B17EFFB5902B84FC7E637B99F66388CB; Path=/; 
HttpOnly

HTTP/1.1 200
Server: nginx/1.25.3
Date: Tue, 19 Mar 2024 17:31:48 GMT
Content-Type: text/html;charset=UTF-8
Connection: close
Set-Cookie: JSESSIONID=7ED8C3838AF6908EEC538A5BA8355394; Path=/; 
HttpOnly
```

##### Sulla console lancia il comando `curl https://art.uniroma2.it`

il comando stampa l'entità contenuta nella risposta ( una pagina HTML ) sulla console

Si otterà una risposta simile alla seguente: 
```
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"><head id="j_idt2">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>ART: Artificial Intelligence Research @ Tor Vergata
  </title>
  <link rel="icon" type="image/ico" href="/images/ArtLogoFavIcon.ico" />
  <link href="/styles/art.css" rel="stylesheet" type="text/css" />
  
  <!-- the following one can be used by specific pages to add further elements to their HEAD declaration --></head><body class="art" onload="">

<div id="container">
  <div id="head_container">
    <div id="left_logo">
		<img src="/images/ArtLogo.jpg" alt="ART Logo" />
    </div>
    <div id="right_logo">
		<p><a class="rightLogo" href="http://www.uniroma2.it"><img src="/images/LogoTorVergataFull.png" alt="Tor Vergata Logo" /></a></p>
    </div>
    <div id="head_middle">
    [Continua fino alla fine del file ...]
```

