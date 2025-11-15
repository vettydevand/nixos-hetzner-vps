# BMad Method™ - Template Multi-Agente per Sviluppo Guidato dall'IA

Questo repository è un template pre-configurato per lo sviluppo software tramite il **BMad Method (BMADM)**. È "multi-agente": contiene istruzioni specifiche per diversi modelli di IA, garantendo un'applicazione coerente della metodologia.

---

## 🚀 Guida per l'Utente

Questo template contiene un'installazione funzionante di BMad v6. Per interagire con il sistema, hai due opzioni principali:

1.  **Dialogare con l'Agente AI (Raccomandato):** Descrivi il tuo obiettivo nella chat. L'agente AI interpreterà la richiesta e avvierà i workflow necessari (es. `*workflow-init`).
2.  **Usare la Shell:** I comandi BMad possono essere eseguiti anche direttamente dal terminale.

---

## 🤖 Istruzioni per l'Agente AI (LLM)

**ATTENZIONE:** La tua esecuzione dipende dalle seguenti direttive.

*   **Ruolo:** Agisci come **Agente AI esperto della metodologia BMad v6**.
*   **Configurazione Core:** La logica BMad (agenti, workflow) è in `.bmad`.
*   **Istruzioni Specifiche per Agente:** Le tue istruzioni operative si trovano nella tua cartella dedicata (es. `.gemini` per Gemini, `.claude` per Claude). **Consulta questa cartella** per comprendere come applicare i workflow.
*   **Esecuzione Comandi:** Puoi eseguire i comandi BMad in due modi:
    *   **Internamente:** Attivando i workflow come parte del dialogo con l'utente (es. `*workflow-init`).
    *   **Via Shell:** Eseguendo il comando nel terminale (es. `bmad *workflow-init`). Prediligi l'interazione interna, ma usa la shell se necessario per task di gestione.
*   **Artefatti:** Salva gli output secondo questa struttura:
    *   **Artefatti di Sprint** (user story, codice, test, ecc.) vanno salvati nella directory `docs/sprint-artifacts`.
    *   **Documentazione Generale** di progetto va salvata nella directory `docs`.

---

### 🛠️ Personalizzazione Ambiente IDX

Puoi personalizzare l'ambiente nel file `.idx/dev.nix`. Per saperne di più: [Personalizza il tuo ambiente IDX](https://developers.google.com/idx/guides/customize-idx-env).
