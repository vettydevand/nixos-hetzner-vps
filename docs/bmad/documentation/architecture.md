# Architettura del Progetto

## Pattern Architetturale: Dichiarativo e Modulare

Questo progetto adotta un pattern architetturale **dichiarativo**, reso possibile dal framework Nix. Invece di definire passaggi imperativi per configurare un sistema, dichiariamo lo stato finale desiderato e Nix si occupa di raggiungerlo.

L'architettura è anche **modulare**, come evidenziato dalla directory `modules/`. Questo approccio consente di:

*   **Separare le responsabilità:** Ogni modulo gestisce una parte specifica della configurazione (es. `storage`, `base`).
*   **Aumentare la riusabilità:** I moduli possono essere riutilizzati in diverse configurazioni di sistema.
*   **Semplificare la manutenzione:** Le modifiche sono isolate all'interno di moduli specifici, riducendo il rischio di effetti collaterali inattesi.

## Flusso dei Dati e della Configurazione

1.  **Punto di Ingresso (`flake.nix`):** Definisce gli input (es. `nixpkgs`), gli output (es. le configurazioni del sistema) e importa i profili.

2.  **Profili (`profiles/*.nix`):** I profili sono il cuore della personalizzazione. Un profilo, come `webserver.nix`, è una collezione di moduli Nix che definiscono un tipo specifico di server. Importa e configura moduli granulari da diverse categorie, come `base`, `security`, `storage`, `containers`, `monitoring`, e `services`.

3.  **Moduli (`modules/*.nix`):** Contengono le opzioni e le definizioni specifiche per ogni parte del sistema. Ad esempio, il modulo `modules/services/web/nginx.nix` definisce le opzioni per configurare il server web Nginx.

4.  **Costruzione (`nix build`):** Nix legge il `flake.nix`, valuta le importazioni dei profili e dei moduli e costruisce una derivazione che rappresenta la configurazione completa del sistema.

5.  **Attivazione:** Il sistema viene attivato per corrispondere alla configurazione appena costruita.

### Esempio Concreto: Il Profilo `webserver`

Per illustrare come funziona questo modello, analizziamo il profilo `webserver`:

1.  **Importazione dei Moduli:** Il file `profiles/webserver.nix` inizia importando una serie di moduli:
    *   `../modules/base/00-hardware.nix`
    *   `../modules/security/02-firewall.nix`
    *   `../modules/storage/01-zfs-pool.nix`
    *   `../modules/services/web/nginx.nix`
    *   E molti altri...

2.  **Configurazione Specifica del Profilo:** Dopo aver importato i moduli, il profilo definisce configurazioni specifiche per un server web:
    *   **Firewall:** Apre le porte 80 e 443.
    *   **ZFS:** Crea un dataset `/var/www` per i dati del sito.
    *   **Nginx:** Abilita Nginx con impostazioni di sicurezza e performance raccomandate.

3.  **Documentazione In-Code:** Il profilo include anche una sezione di documentazione che ne descrive le caratteristiche e fornisce esempi di utilizzo.

Questo approccio a più livelli (`flake.nix` -> `profiles` -> `modules`) consente di avere una base di codice pulita, manutenibile e facilmente estendibile, dove ogni file ha una responsabilità chiara e definita.
