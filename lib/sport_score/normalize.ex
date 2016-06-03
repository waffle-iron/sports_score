defmodule SportScore.Normalize do


  def normalize(text) do
    Regex.replace(~r/[^\w]/iu, text, "")
    |> String.downcase
  end

end
