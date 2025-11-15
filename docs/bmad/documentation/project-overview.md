# Panoramica del Progetto

## Riepilogo Esecutivo

Questo progetto è un **template avanzato per il deployment di server NixOS su Hetzner Cloud**. Sfrutta la potenza di Nix per creare configurazioni di sistema dichiarative, riproducibili e ottimizzate. L'infrastruttura è definita come codice e organizzata in moduli riutilizzabili, garantendo coerenza, manutenibilità e l'adozione di best practice. Lo scopo è fornire un "acceleratore" per deployare server complessi in modo rapido e affidabile.

## Stack Tecnologico

| Categoria | Tecnologia | Versione | Giustificazione |
|---|---|---|---|
| Gestione Configurazione OS | Nix (Flakes) | `nixos-24.05` | `flake.nix` definisce l'intero sistema in modo riproducibile. |
| Target Infrastruttura | Hetzner Cloud | N/A | Il modulo `nixos-hardware` è incluso per ottimizzazioni specifiche. |
| Architettura | Modulare | N/A | La directory `modules/` contiene logica di infrastruttura riutilizzabile. |
| Containerizzazione | Docker | Gestito da Nix | Profilo `container-host` disponibile. |
| Web Serving | Nginx | Gestito da Nix | Profilo `webserver` disponibile. |
| Filesystem Avanzato | ZFS | Gestito da Nix | Modulo avanzato con tuning, monitoraggio e alerting. |
| Dev Environment | Nix Shell | `stable-24.05` | `.idx/dev.nix` e `flake.nix` forniscono un ambiente di sviluppo completo. |

## Struttura del Repository

*   **Tipo:** Monorepo (Monolith)
*   **Logica:** La codebase è gestita come una singola unità coesa, ma è altamente modularizzata per separazione dei concetti.
    *   `flake.nix`: Entrypoint principale che definisce le configurazioni NixOS e la `devShell`.
    *   `profiles/`: Contiene le configurazioni di alto livello per tipi specifici di server (es. `webserver`, `container-host`). Combina i moduli sottostanti.
    *   `modules/`: Contiene moduli riutilizzabili e auto-contenuti che implementano funzionalità specifiche (es. hardware, storage ZFS).
    *   `scripts/`: Contiene script di utility, come il wizard di configurazione interattiva.
    *   `templates/`: Contiene i template Nix usati dallo script di setup per generare il `flake.nix` finale.

## Workflow Utente Previsto

Il template è progettato per essere usato attraverso un semplice wizard:

1.  **Clonazione:** L'utente clona il repository.
2.  **Configurazione:** L'utente esegue lo script `./scripts/setup/interactive-config.sh`.
3.  **Input:** Lo script pone domande chiave (hostname, utente, chiave SSH, profilo del server).
4.  **Generazione:** Viene generato un file `flake.nix` personalizzato a partire dai template.
5.  **Deployment:** L'utente può deployare il server su Hetzner usando i comandi standard di NixOS (`nixos-rebuild`).
