defmodule Prismic.Fragment.StructuredText.BlockGroup do
  @type kind :: :ol | :ul | nil
  @type blocks :: [Heading.t() | Image.t() | ListItem.t() | Paragraph.t() | Preformatted.t()]
  @type t :: %__MODULE__{kind: kind, blocks: blocks}

  defstruct [:kind, blocks: []]

  alias Prismic.Fragment.StructuredText.Block

  def add_block(block_group = %{blocks: blocks}, block) do
    %{block_group | blocks: [block | blocks]}
  end

  def as_html(%__MODULE__{kind: :ol, blocks: blocks}, link_resolver, html_serializer) do
    ["<ol>", blocks_html(blocks, link_resolver, html_serializer), "</ol>"]
  end

  def as_html(%__MODULE__{kind: :ul, blocks: blocks}, link_resolver, html_serializer) do
    ["<ul>", blocks_html(blocks, link_resolver, html_serializer), "</ul>"]
  end

  def as_html(%__MODULE__{kind: nil, blocks: blocks}, link_resolver, html_serializer) do
    blocks_html(blocks, link_resolver, html_serializer)
  end

  defp blocks_html(blocks, link_resolver, html_serializer) do
    Enum.map(blocks, &Block.as_html(&1, link_resolver, html_serializer))
  end
end
