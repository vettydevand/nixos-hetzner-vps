# Contribuire a NixOS Hetzner VPS Template

Grazie per il tuo interesse nel contribuire a questo progetto! Diamo il benvenuto a contributi da parte di tutti, indipendentemente dal livello di esperienza.

## 🤝 Come Contribuire

### Cerca un Compito

- **Segnalazione di Problemi:** Controlla prima le issue esistenti per evitare duplicati. Usa il [template per le segnalazioni di bug](.github/ISSUE_TEMPLATE/bug_report.md) per i bug e il [template per le richieste di funzionalità](.github/ISSUE_TEMPLATE/feature_request.md) per le nuove funzionalità. Includi passaggi dettagliati per riprodurre i bug.
- **Per i Primi Contributi:** Se sei nuovo nel progetto, cerca le issue con l'etichetta ["good first issue"](https://github.com/vettydevand/nixos-hetzner-vps/labels/good%20first%20issue). Sono un ottimo modo per iniziare.

### Flusso di Lavoro per le Pull Request

1.  **Fork e Clona:** Esegui il fork del repository e clonalo in locale.
2.  **Crea un Nuovo Branch:** `git checkout -b feature/il-tuo-nome-funzionalita`
3.  **Apporta le Modifiche:** Esegui le modifiche e committale con messaggi descrittivi.
4.  **Push sul Tuo Fork:** `git push origin feature/il-tuo-nome-funzionalita`
5.  **Crea una Pull Request:** Apri una pull request verso il branch `main` del repository originale, utilizzando il nostro [template per le pull request](.github/PULL_REQUEST_TEMPLATE.md).

## ⚙️ Flusso di Lavoro di Sviluppo

### Setup dell'Ambiente

Questo progetto usa un **ambiente di sviluppo Nix** per garantire che tutti i collaboratori utilizzino le stesse versioni degli strumenti.

1.  **Entra nella Shell di Sviluppo:** Dopo aver clonato il repository, esegui questo comando per avviare una shell con tutti gli strumenti necessari (come `nixpkgs-fmt`, `shellcheck`, etc.):
    ```bash
    nix develop
    ```
2.  **Sviluppa:** Ora sei pronto per iniziare a sviluppare!

### Testare le Modifiche

Prima di inviare una pull request, per favore testa le tue modifiche:

```bash
# Formatta e controlla la sintassi di Nix
nix flake check

# Controlla gli script di shell
shellcheck scripts/*.sh

# Esegui i test in una VM (richiede KVM)
nix run .#test-vm
```

## ✍️ Linee Guida sullo Stile del Codice

### Codice Nix

- **Formattazione:** Usa `nixpkgs-fmt` per formattare automaticamente il tuo codice.
  ```bash
  nixpkgs-fmt .
  ```
- **Stile:** Segui le linee guida di stile di Nixpkgs, mantieni le righe sotto i 100 caratteri e usa nomi di variabili descrittivi.
- **Documentazione:** Documenta le funzioni complesse.

### Script di Shell

- Usa `set -euo pipefail` all'inizio degli script.
- Aggiungi la gestione degli errori con `trap`.
- Usa funzioni per il codice riutilizzabile.

### Documentazione

- Scrivi in un inglese chiaro e conciso.
- Usa la formattazione Markdown in modo consistente.
- Includi esempi di codice dove rilevante.

## 🧱 Guida al Contributo di Moduli

I moduli sono la spina dorsale di questo progetto. Ecco come aggiungerne uno nuovo.

### Struttura di un Modulo

1.  **Posizionamento:** I nuovi moduli dovrebbero essere inseriti in una sottodirectory appropriata all'interno di `modules/` (es. `modules/services/web/nuovo-servizio.nix`).
2.  **Struttura del File:** Un modulo tipico ha questa struttura:

    ```nix
    { config, lib, pkgs, ... }:

    with lib;

    let
      cfg = config.services.nuovo-servizio;
    in
    {
      options.services.nuovo-servizio = {
        enable = mkEnableOption "Abilita il nuovo servizio";
        # Altre opzioni qui...
      };

      config = mkIf cfg.enable {
        # La tua configurazione qui...
        environment.systemPackages = [ pkgs.nuovo-pacchetto ];
      };
    }
    ```

### Esporre le Opzioni

- Usa `mkEnableOption` per le opzioni booleane `enable`.
- Fornisci descrizioni chiare per tutte le opzioni.
- Usa `mkIf cfg.enable` per assicurarti che la tua configurazione venga applicata solo quando il modulo è abilitato.

## ✅ Requisiti per le Pull Request

- Tutti i test devono passare.
- La documentazione deve essere aggiornata per le nuove funzionalità.
- Il file `CHANGELOG.md` deve essere aggiornato.
- Nessun conflitto di merge con il branch `main`.
- Revisione del codice da parte di almeno un maintainer.

## 🚀 Processo di Rilascio

- I rilasci sono etichettati con versionamento semantico (vX.Y.Z).
- Il `CHANGELOG.md` viene aggiornato ad ogni rilascio.
- Vengono create delle GitHub Release con note dettagliate.

---
Questo documento segue il codice di condotta [Contributor Covenant](https://www.contributor-covenant.org/).
