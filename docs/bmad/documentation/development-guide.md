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

Sostituisci `<hostname>` con il nome dell'host della macchina per cui vuoi costruire la configurazione (es. `nixos`).

## Deployment

Per applicare la configurazione a un sistema NixOS in esecuzione:

```bash
sudo nixos-rebuild switch --flake .#<hostname>
```

## Contributi

Per favore, consulta il file `CONTRIBUTING.md` per le linee guida dettagliate su come contribuire al progetto.
