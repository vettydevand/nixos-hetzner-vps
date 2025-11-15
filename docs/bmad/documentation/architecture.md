# Architettura del Progetto

## Pattern Architetturale: Dichiarativo e Modulare

Questo progetto adotta un pattern architetturale **dichiarativo**, reso possibile dal framework Nix. Invece di definire passaggi imperativi per configurare un sistema, dichiariamo lo stato finale desiderato e Nix si occupa di raggiungerlo.

L'architettura è anche **modulare**, come evidenziato dalla directory `modules/`. Questo approccio consente di:

*   **Separare le responsabilità:** Ogni modulo gestisce una parte specifica della configurazione (es. `storage`, `base`).
*   **Aumentare la riusabilità:** I moduli possono essere riutilizzati in diverse configurazioni di sistema.
*   **Semplificare la manutenzione:** Le modifiche sono isolate all'interno di moduli specifici, riducendo il rischio di effetti collaterali inattesi.

## Flusso dei Dati e della Configurazione

1.  **Punto di Ingresso (`flake.nix`):** Definisce gli input (es. `nixpkgs`), gli output (es. le configurazioni del sistema) e importa i moduli necessari.
2.  **Moduli (`modules/*.nix`):** Contengono le opzioni e le definizioni specifiche per ogni parte del sistema.
3.  **Costruzione (`nix build`):** Nix legge il `flake.nix`, valuta le importazioni dei moduli e costruisce una derivazione che rappresenta la configurazione completa del sistema.
4.  **Attivazione:** Il sistema viene attivato per corrispondere alla configurazione appena costruita.
