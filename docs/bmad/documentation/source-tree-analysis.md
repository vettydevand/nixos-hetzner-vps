# Analisi dell'Albero dei Sorgenti

Questa è una vista annotata delle directory e dei file più importanti del progetto.

```
project-root/
├── .idx/
│   └── dev.nix          # Punto di ingresso per l'ambiente di sviluppo di Firebase Studio.
├── bmad/                # Framework di automazione BMad (meta-documentazione).
│   ├── bmb/             # Moduli per BMad Builder.
│   ├── bmm/             # Moduli per il BMad Method (il workflow che stiamo usando ora).
│   ├── cis/             # Moduli per il Creative Intelligence Squad.
│   └── core/            # Funzionalità di base di BMad.
├── docs/                # Documentazione generale e output dei workflow.
│   └── bmm-workflow-status.yaml # Traccia lo stato di avanzamento del progetto.
├── modules/             # Directory contenente i moduli di configurazione riutilizzabili.
│   ├── base/            # Moduli di base del sistema operativo.
│   └── storage/         # Moduli per la configurazione dello storage.
├── scripts/             # Script di utilità.
│   └── setup/
│       └── interactive-config.sh # Script per la configurazione interattiva.
├── flake.nix            # Punto di ingresso principale per la configurazione del sistema NixOS.
├── README.md            # Informazioni generali sul progetto.
└── CONTRIBUTING.md      # Linee guida per i contributori.
```
