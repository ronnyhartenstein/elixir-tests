Issues
======

Übungsbeispiel aus Buch "Programming Elixir", Kapitel 13, "Organizing a Project"

Issues zu einem Github Projekt via REST-API als JSON ziehen und tabellarisch darstellen. Realisiert als CLI-Programm, Ausgabe in Konsole.

## Testen via `mix`

    iex -S mix

    Issues.CLI.process {"elixir-lang", "elixir", 1}
    

## Build `escript`

Konfiguriert in `mix.exs`

Bauen mit

    mix escript.build

Testen

    ./issues elixir-lang elixir 3
