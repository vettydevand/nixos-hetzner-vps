# Security Policy

La sicurezza di questo progetto è una priorità assoluta. Apprezziamo i tuoi sforzi per divulgare responsabilmente le tue scoperte e faremo ogni sforzo per affrontare tutti i problemi segnalati.

## 🛡️ Versioni Supportate

Gli aggiornamenti di sicurezza vengono forniti per l'ultima versione sul branch `main`. Ti consigliamo di utilizzare sempre il commit più recente.

| Versione | Supportato |
| :--- | :--- |
| ultimo `main` | ✅ Sì |
| < ultimo `main` | ❌ No |

## 🚨 Segnalazione di una Vulnerabilità

**Per favore, non segnalare vulnerabilità di sicurezza tramite le issue pubbliche di GitHub.**

Per garantire la sicurezza dei nostri utenti, ti chiediamo di segnalare le vulnerabilità in privato. Questo progetto ha abilitato la funzione di segnalazione privata delle vulnerabilità di GitHub.

Per favore, segnala le vulnerabilità di sicurezza **andando alla scheda "Security" del nostro repository GitHub** e cliccando su "Report a vulnerability".

### Cosa includere nella tua segnalazione:

- Una descrizione chiara della vulnerabilità.
- Il componente o i file interessati.
- I passaggi per riprodurre la vulnerabilità (se possibile).
- L'impatto potenziale della vulnerabilità.
- Una correzione o mitigazione suggerita (se ne hai una).

Faremo del nostro meglio per fornire un riconoscimento iniziale entro 48 ore e tenerti aggiornato sullo stato di avanzamento di una correzione.

## 🔒 Best Practice di Sicurezza

### Per gli Utenti

- Usa passphrase forti e uniche per la crittografia LUKS.
- Mantieni il tuo sistema aggiornato regolarmente scaricando le ultime modifiche da `main` ed eseguendo `nixos-rebuild switch`.
- Controlla regolarmente le tue chiavi SSH e le regole del firewall.
- Abilita gli snapshot ZFS e mantieni backup esterni.

### Per i Contributori

- Non committare mai segreti o credenziali nel repository.
- Usa la shell di sviluppo Nix fornita (`nix develop`) per assicurarti di utilizzare versioni testate degli strumenti.
- Convalida tutti gli input dell'utente in qualsiasi script che contribuisci.
- Segui il principio del privilegio minimo nelle configurazioni.
- Documenta eventuali implicazioni per la sicurezza delle tue modifiche nella tua pull request.

## 📢 Processo di Divulgazione

Una volta segnalata una vulnerabilità, noi:
1.  Confermeremo la vulnerabilità e ne determineremo l'impatto.
2.  Svilupperemo una patch internamente.
3.  Rilasceremo la patch e, se necessario, emetteremo un avviso di sicurezza.

Ci impegniamo a gestire tutte le segnalazioni in modo tempestivo e professionale.
