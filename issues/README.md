Issues
======

Übungsbeispiel aus Buch "Programming Elixir", Kapitel 13, "Organizing a Project"

Issues zu einem Github Projekt via REST-API als JSON ziehen und tabellarisch darstellen. Realisiert als CLI-Programm, Ausgabe in Konsole.

## Testen

### direkt via `mix`

    iex -S mix

    Issues.CLI.process {"elixir-lang", "elixir", 1}

### `DocTest`s

Inline-Doku mit IEx-Beispielen sind u.a. für `table_formatter.exs` integriert. Aufruf:

    mix test test/doc_test.exs

### Unit-Tests

    mix test


## Dokumentation

ExDocs erstellen so:

    mix docs


## Build `escript`

Konfiguriert in `mix.exs`

Bauen mit

    mix escript.build

Testen

    ./issues elixir-lang elixir 3
