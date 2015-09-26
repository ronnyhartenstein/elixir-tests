defmodule Issues.TableFormatter do

  import Enum, only: [ each: 2, map: 2, map_join: 3, max: 1 ]

  @doc """
  Nimmt eine Liste mit Zeilen (rows), wo jede Zeile (row) ein HashDict ist,
  und ein Liste mit Spaltennamen (headers).
  Gibt eine Tabelle mit den Daten auf STDOUT aus
  - aus jeder Zeile (`row`), identifiziert durch jeden Spalte (`header`).
  Jede Spalte identifizierte eine Spalte (`column`), und diese Spalten (`columns`) werden
  aus den `rows` extrahiert.
  Wir berechnen die Breite jeder Spalte damit die breiteste passt.
  """
  def print_table_for_columns(rows, headers) do
    data_by_columns = split_into_columns(rows, headers)
    column_widths = widths_of(data_by_columns)
    format = format_for(column_widths)

    puts_one_line_in_columns headers, format
    IO.puts separator(column_widths)
    puts_in_columns data_by_columns, format
  end

  @doc """
  Gegeben ist eine Menge Zeilen (`rows`), wobei jede Zeile (row) eine keyed list
  an Spalten hat. Gibt eine Liste aus Listen mit den Daten jeder Spalte zurück.
  Der `headers` Parameter beinhaltet eine Liste an Spalten zum extrahieren.

  ## Example
      iex> list = [Enum.into([{"a","1"},{"b","2"},{"c","3"}], HashDict.new),
      ...>         Enum.into([{"a","4"},{"b","5"},{"c","6"}], HashDict.new)]
      iex> Issues.TableFormatter.split_into_columns(list, ["a","b","c"])
      [["1","4"],["2","5"],["3","6"]]
  """
  def split_into_columns(rows, headers) do
    for header <- headers do
      for row <- rows, do: printable(row[header])
    end
  end

  @doc """
  Gibt eine binary (string) Version unseres Parameters zurück.

  ## Example
      iex> Issues.TableFormatter.printable("a")
      "a"
      iex> Issues.TableFormatter.printable(99)
      "99"
  """
  def printable(str) when is_binary(str), do: str
  def printable(str), do: to_string(str)

  @doc """
  Gegen ist eine Liste mit Unterlisten, wobei jede Unterliste
  die Daten für eine Spalte beinhaltet.
  Gibt eine Liste zurück mit der Maximalbreite je Spalte.

  ## Example
      iex> data =[["cat","wombat","elk"],["mongoose","ant","gnu"]]
      iex> Issues.TableFormatter.widths_of(data)
      [6,8]
  """
  def widths_of(columns) do
    for column <- columns, do: column |> map(&String.length/1) |> max
  end

  @doc """
  Gibt einen formatierten String zurück, der die Breiten
  eines Sets an Spalten festschreibt.
  Wir schreiben `" | "` zwischen die Spalten.

  ## Example
      iex> widths = [5,6,99]
      iex> Issues.TableFormatter.format_for(widths)
      "~-5s | ~-6s | ~-99s~n"
  """
  def format_for(column_widths) do
    map_join(column_widths, " | ", fn width -> "~-#{width}s" end) <> "~n"
  end

  @doc """
  Generiert die Linie unter den Spaltenköpfen.
  Es werden Leerzeichen als Abstand zu den Spaltenstrichen eingefügt.

  ## Example
      iex> widths = [5,6,9]
      iex> Issues.TableFormatter.separator(widths)
      "------+--------+----------"
  """
  def separator(column_widths) do
    map_join(column_widths, "-+-", fn width -> List.duplicate("-", width) end)
  end

  @doc """
  Gegeben ist eine Liste mit Zeilen voll Daten, eine Liste mit Spaltenselektoren,
  und ein Format-String.
  Schreibt die extrahierten Daten mittels der Kontrolle des Format-Strings.
  """
  def puts_in_columns(data_by_columns, format) do
    data_by_columns
    |> List.zip
    |> map(&Tuple.to_list/1)
    |> each(&puts_one_line_in_columns(&1, format))
  end

  def puts_one_line_in_columns(fields, format) do
    :io.format(format, fields)
  end
end
