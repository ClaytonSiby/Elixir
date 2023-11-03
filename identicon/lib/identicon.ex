defmodule Identicon do
  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
  end

  def build_grid(%Identicon.Image{hex: hex} = image) do
    grid =
      hex
      |> Enum.chunk_every(3, 2, :discard)
      |> Enum.map(&mirror_row/1) # the & is a reference to the function, in this case mirror_row, the /1 is the arity
      |> List.flatten
      |> Enum.with_index

    %Identicon.Image{ image | grid: grid }
  end

  def mirror_row(row) do
    [first, second | _tail] = row # pattern matching

    row ++ [second, first] # join the lists together
  end

  def pick_color(%Identicon.Image { hex: [r, g, b | _tail] } = image) do
    %Identicon.Image{image | color: {r, g, b}} # tuple {r,g,b}
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end
end
