{ pkgs, ... }: {
  # Specifica il canale nixpkgs da utilizzare. 
  # "stable-24.05" garantisce build riproducibili.
  channel = "stable-24.05";

  # Elenco dei pacchetti di sistema da installare nell'ambiente.
  # Questi strumenti sono utili per lo sviluppo e il linting di Nix.
  packages = [
    pkgs.nixpkgs-fmt      # Per la formattazione del codice Nix.
    pkgs.shellcheck       # Strumento di analisi statica per script di shell.
    pkgs.statix           # Linter per il codice Nix per individuare errori.
    pkgs.deadnix          # Trova e rimuove il codice Nix non utilizzato.
    pkgs.nil              # Language server per Nix.
    pkgs.markdownlint-cli # Strumento a riga di comando per il linting dei file Markdown.
    pkgs.mkdocs           # Generatore di documentazione statica.
    pkgs.python3          # Linguaggio di programmazione Python.
  ];

  # Configurazione specifica dell'IDE di Firebase Studio.
  idx = {
    # Elenco delle estensioni di VS Code da installare.
    extensions = [
      # Companion IDE Gemini
      "google.gemini-cli-vscode-ide-companion"
      # Estensioni per un migliore supporto a Nix nell'editor.
      "jnoortheen.nix-ide"
      "bbenoist.nix"
    ];

    # Hook del ciclo di vita dell'area di lavoro.
    workspace = {
      # Comandi da eseguire all'avvio dell'area di lavoro.
      onStart = {
        welcome-message = "echo \"Ambiente di sviluppo pronto! Strumenti disponibili: nixpkgs-fmt, shellcheck, markdownlint, mkdocs\"";
      };
    };
  };
}
