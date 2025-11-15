
{ ... }: {
  # Importa la devShell dal file flake.nix.
  # Questo assicura che l'ambiente dell'IDE sia coerente con quello
  # che si otterrebbe eseguendo `nix develop` nel terminale.
  imports = [
    ./../flake.nix
  ];

  # Usa la devShell definita nella flake.
  devShell = "devShells.x86_64-linux.default";

  idx = {
    # Estensioni di VS Code da installare.
    extensions = [
      "google.gemini-cli-vscode-ide-companion"
      # Estensioni specifiche per Nix per una migliore esperienza di sviluppo.
      "jnoortheen.nix-ide"
      "bbenoist.nix"
    ];

    # Hook del ciclo di vita dello spazio di lavoro.
    workspace = {
      # Viene eseguito quando uno spazio di lavoro viene creato per la prima volta.
      onCreate = {
        # Apri questi file per impostazione predefinita per i nuovi utenti.
        default.openFiles = [
          "README.md"
          "flake.nix"
          ".idx/dev.nix"
          "profiles/webserver.nix"
        ];
      };
    };
  };
}
