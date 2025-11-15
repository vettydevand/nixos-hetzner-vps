# 🚀 NixOS Hetzner VPS Template

[![NixOS](https://img.shields.io/badge/NixOS-24.05-blue?logo=nixos&logoColor=white)](https://nixos.org)
[![CI/CD](https://github.com/vettydevand/nixos-hetzner-vps/actions/workflows/ci-advanced.yml/badge.svg)](https://github.com/vettydevand/nixos-hetzner-vps/actions)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Documentation](https://img.shields.io/badge/Documentation-Online-blue)](https://vettydevand.github.io/nixos-hetzner-vps/)

**Template di deployment NixOS pronto per la produzione per VPS Hetzner con ZFS + LUKS + Podman**

❌ **Testato in produzione**  
✅ **Installazione completamente automatizzata**  
✅ **Ottimizzato per ambienti cloud**  
✅ **Documentazione completa inclusa**  
✅ **Architettura modulare**  
✅ **Sito di documentazione professionale**

## 🌟 Caratteristiche

### 🔒 Sicurezza Prima di Tutto
- **Cifratura completa del disco**: Cifratura LUKS per tutti i dati a riposo
- **Hardening di SSH**: Nessun login di root, autenticazione con password disabilitata
- **Firewall di default**: Esposte solo le porte essenziali (22, 80, 443)
- **Moduli di sicurezza**: Funzionalità di sicurezza indipendenti che possono essere abilitate/disabilitate
- **Aggiornamenti regolari**: Facili aggiornamenti di sistema con la riproducibilità di NixOS

### ⚡ Ottimizzato per le Prestazioni
- **Ottimizzazione di ZFS ARC**: Limitato a 1GB per prestazioni stabili del VPS
- **Separazione dei dataset**: Dataset indipendenti per `/nix`, `/containers`, `/persist`
- **Compressione abilitata**: Compressione LZ4 per l'efficienza dello storage
- **Rilevamento hardware**: Ottimizzazione automatica per l'hardware Hetzner
- **Profili di carico di lavoro**: Impostazioni ottimizzate per diversi casi d'uso

### 🧩 Architettura Modulare
- **Moduli atomici**: Ogni modulo è autonomo e testabile
- **Composizione sull'ereditarietà**: Mescola e abbina i moduli come i LEGO
- **Sistema di profili**: Profili pre-configurati per casi d'uso comuni
- **Zero dipendenze**: I moduli non dipendono dallo stato interno degli altri
- **Tutto dichiarativo**: Infrastruttura, sicurezza e runtime

### 🐳 Pronto per i Container
- **Podman rootless**: Runtime di container sicuro senza privilegi di root
- **Integrazione con Systemd**: Gestione nativa dei servizi per i container
- **Compatibile con Docker**: Livello di compatibilità con la CLI di Docker
- **Storage dedicato**: Dataset ZFS isolato per i dati dei container
- **Supporto per registry**: Configurazione del registry privato inclusa

### 🔄 Deployment Flessibile
- **Modalità Rescue**: Installazione completamente automatizzata tramite il sistema di rescue di Hetzner
- **Live ISO**: Installazione manuale con pieno controllo e debugging
- **Cloud-init**: Deployment zero-touch per l'automazione dell'infrastruttura
- **Sistema di template**: Facile configurazione tramite file di template
- **Wizard interattivo**: Setup guidato per i principianti

## 🚀 Quick Start

### Opzione 1: Wizard Interattivo (Consigliato)

Questo wizard ti guiderà attraverso la configurazione del tuo server passo dopo passo.

```bash
# 1. Clona il repository
git clone https://github.com/vettydevand/nixos-hetzner-vps
cd nixos-hetzner-vps

# 2. Esegui il wizard di configurazione
./scripts/setup/interactive-config.sh
```

### Opzione 2: Installazione Rapida (Utenti Avanzati)

Questo script genera la configurazione ed esegue l'installazione in un unico comando.

```bash
# Esegui l'installer con i tuoi parametri
./scripts/setup/quick-install.sh \
  --hostname "my-server" \
  --profile "full-stack" \
  --ssh-key-file "~/.ssh/my_key.pub" \
  --hetzner-token "YOUR_HETZNER_API_TOKEN"
```

##  profiles/ Profili Disponibili

- **minimal**: Un sistema base NixOS con hardening di sicurezza. Ideale come punto di partenza.
- **webserver**: Include Nginx e Certbot per un hosting web sicuro con certificati SSL automatici.
- **container-host**: Configura Podman (compatibile con Docker) per eseguire applicazioni containerizzate.
- **full-stack**: Un ambiente di sviluppo e produzione completo con web server, container e strumenti come Node.js e Go.

## 📚 Documentazione

Visita il nostro **[sito di documentazione completo](https://vettydevand.github.io/nixos-hetzner-vps/)** per guide dettagliate, riferimenti e tutorial.

- **[🚀 Getting Started](https://vettydevand.github.io/nixos-hetzner-vps/beginner/getting-started/)**: La tua guida per iniziare in 5 minuti.
- **[🏗️ Architecture](https://vettydevand.github.io/nixos-hetzner-vps/architecture/overview/)**: Un'analisi approfondita del design modulare.
- **[🧩 Modules](https://vettydevand.github.io/nixos-hetzner-vps/modules/base/)**: Riferimento per tutti i moduli disponibili.
- **[👤 Profiles](https://vettydevand.github.io/nixos-hetzner-vps/profiles/vps/)**: Guide per i profili di server pre-configurati.

### Risorse della Community
- [GitHub Discussions](https://github.com/vettydevand/nixos-hetzner-vps/discussions) - Domande e risposte e richieste di funzionalità
- [NixOS Wiki](https://nixos.wiki) - Base di conoscenza generale di NixOS

## 🏗️ Panoramica dell'Architettura

### Design Modulare
```
┌─────────────────────────────────────────────────────────────────┐
│                       Configurazione NixOS                      │
├─────────────────┬─────────────────┬─────────────────────────────┤
│   Livello Base  │ Livello Sicurezza │     Livello Servizi         │
├─────────────────┼─────────────────┼─────────────────────────────┤
│ • Hardware      │ • LUKS          │ • Server Web                │
│ • Boot Loader   │ • Firewall      │ • Database                  │
│ • Utenti        │ • SSH           │ • Sistemi di Cache          │
│ • Networking    │ • Hardening     │ • Monitoraggio              │
├─────────────────┼─────────────────┼─────────────────────────────┤
│    Livello Storage (ZFS)                                        │
├─────────────────────────────────────────────────────────────────┤
│                  Hardware (VPS Hetzner)                         │
└─────────────────────────────────────────────────────────────────┘
```

## 🤝 Contribuire

Diamo il benvenuto ai contributi! Per favore leggi la nostra guida [CONTRIBUTING.md](CONTRIBUTING.md) per iniziare.

### Modi per Contribuire
- 🐛 Segnala bug e problemi
- 📝 Migliora la documentazione
- 💻 Invia pull request per nuove funzionalità
- 🌐 Traduci la documentazione in altre lingue

## 🛡️ Sicurezza

La sicurezza è la nostra massima priorità. Per favore, consulta la nostra policy [SECURITY.md](SECURITY.md) per segnalare vulnerabilità.

## 🙏 Ringraziamenti

- [Community NixOS](https://nixos.org/community.html) per gli strumenti e il supporto straordinari
- [Hetzner](https://hetzner.com) per l'eccellente infrastruttura VPS
- Il team di [ZFS on Linux](https://zfsonlinux.org) per il robusto filesystem
- Tutti i contributori che hanno aiutato a migliorare questo template

## 📜 Licenza

Questo progetto è sotto licenza MIT - vedi il file [LICENSE](LICENSE) per i dettagli.
