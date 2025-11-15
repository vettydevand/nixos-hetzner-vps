# Profili del Server

Questo progetto utilizza un sistema di profili per definire le configurazioni dei server. I profili sono collezioni di moduli Nix che definiscono un tipo specifico di server. Questo approccio consente di creare configurazioni specializzate e ottimizzate per diversi casi d'uso.

## Profili Disponibili

### Web Server (`webserver.nix`)

Questo profilo è ottimizzato per l'hosting di siti e applicazioni web.

**Caratteristiche:**

*   **Server Web:** Nginx e Caddy preconfigurati con best practice di sicurezza e performance.
*   **SSL Automatico:** Gestione automatica dei certificati SSL tramite ACME (Let's Encrypt).
*   **Storage Ottimizzato:** Configurazione di ZFS con compressione LZ4 e snapshot frequenti, ideale per i dati di un sito web.
*   **Monitoring Integrato:** Include Prometheus e Grafana per il monitoraggio delle performance del server web.
*   **Sicurezza:** Firewall configurato, hardening di SSH e header HTTP di sicurezza.

**Casi d'Uso:**

*   Siti web personali e blog.
*   Applicazioni web e API.
*   Hosting di siti statici.
*   Setup di reverse proxy.

**Esempio di Configurazione (Nginx):**

```nix
services.nginx.virtualHosts."blog.example.com" = {
  forceSSL = true;
  enableACME = true;
  locations."/" = {
    root = "/var/www/blog";
  };
};
```

### Container Host (`container-host.nix`)

Questo profilo è progettato per eseguire e gestire container con Podman.

**Caratteristiche:**

*   **Runtime Container:** Podman preinstallato e configurato.
*   **Compatibilità Docker:** Socket Docker-compatible abilitato per l'utilizzo di strumenti come `docker-compose`.
*   **Networking:** Rete di default con supporto DNS abilitato per i container.
*   **Gestione Rootless:** Configurazione per la gestione dei container da parte di utenti non-root.

**Casi d'Uso:**

*   Esecuzione di applicazioni containerizzate.
*   Ambienti di sviluppo basati su container.
*   Microservizi.

**Esempio di Utilizzo:**

Dopo aver applicato questo profilo, è possibile utilizzare i comandi `podman` e `docker-compose` per gestire i container.

```bash
# Eseguire un container Nginx
podman run -d -p 8080:80 nginx

# Utilizzare docker-compose
docker-compose up -d
```

### Profilo Minimo (`minimal.nix`)

Questo profilo fornisce una configurazione di base di NixOS, ideale come punto di partenza per configurazioni personalizzate. Include solo i moduli di base essenziali.
