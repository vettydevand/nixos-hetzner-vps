# Guida allo Sviluppo

Questa guida fornisce le istruzioni per configurare e lavorare su questo progetto NixOS.

## Configurazione dell'Ambiente

L'ambiente di sviluppo è completamente gestito da Nix e Firebase Studio.

1.  **Prerequisiti:** Assicurati di avere Firebase Studio installato.
2.  **Apertura del Progetto:** Apri questa directory in Firebase Studio. L'ambiente verrà configurato automaticamente leggendo il file `.idx/dev.nix`.

## Costruzione (Build)

Per costruire la configurazione del sistema definita nel flake, esegui il seguente comando dalla root del progetto:

```bash
nix build .#<hostname>
```

Sostituisci `<hostname>` con il nome dell'host della macchina per cui vuoi costruire la configurazione (es. `hetzner-webserver`).

## Deployment

Per applicare la configurazione a un sistema NixOS in esecuzione:

```bash
sudo nixos-rebuild switch --flake .#<hostname>
```

## Esempi Pratici

Questa sezione mostra come utilizzare il profilo `webserver` per configurare scenari comuni. Per utilizzare questi esempi, dovrai prima creare una tua configurazione NixOS che importi il profilo `webserver.nix`.

### Configurare un Blog Semplice

Questo esempio mostra come configurare Nginx per servire un blog statico con SSL automatico.

**Configurazione:**

Aggiungi il seguente codice alla tua configurazione NixOS:

```nix
services.nginx.virtualHosts."blog.example.com" = {
  forceSSL = true;        # Forza l'uso di HTTPS
  enableACME = true;      # Abilita i certificati SSL con Let's Encrypt
  locations."/" = {
    root = "/var/www/blog"; # Directory contenente i file del blog
  };
};
```

**Descrizione:**

*   Questa configurazione crea un virtual host per `blog.example.com`.
*   Tutto il traffico HTTP verrà reindirizzato a HTTPS.
*   Nginx otterrà e rinnoverà automaticamente un certificato SSL.
*   I file del sito verranno serviti dalla directory `/var/www/blog`.

### Configurare un API Gateway

Questo esempio mostra come usare Nginx come reverse proxy per un'applicazione API in esecuzione sulla porta 3000.

**Configurazione:**

Aggiungi il seguente codice alla tua configurazione NixOS:

```nix
services.nginx.virtualHosts."api.example.com" = {
  forceSSL = true;
  enableACME = true;
  locations."/api/" = {
    proxyPass = "http://localhost:3000"; # Inoltra le richieste all'API
    proxyWebsockets = true;              # Abilita il supporto per WebSocket
  };
};
```

**Descrizione:**

*   Questa configurazione crea un virtual host per `api.example.com`.
*   Le richieste che iniziano con `/api/` verranno inoltrate all'applicazione in esecuzione su `http://localhost:3000`.
*   Il supporto per i WebSocket è abilitato, utile per le applicazioni real-time.

## Contributi

Per favore, consulta il file `CONTRIBUTING.md` per le linee guida dettagliate su come contribuire al progetto.
