alias Prismic.Fragment.StructuredText.Block

defmodule Block.Text.Heading do
  defstruct [:level, :text, :label, spans: []]

  @type t :: %__MODULE__{
          level: Integer.t(),
          text: String.t(),
          spans: [Span.t()],
          label: String.t()
        }
end

defimpl Block, for: Block.Text.Heading do
  alias Block.Text.Heading

  def as_html(%Heading{level: 1, text: text}, _link_resolver, _html_serializer),
    do: ["<h1>", text, "</h1>"]

  def as_html(%Heading{level: 2, text: text}, _link_resolver, _html_serializer),
    do: ["<h2>", text, "</h2>"]

  def as_html(%Heading{level: 3, text: text}, _link_resolver, _html_serializer),
    do: ["<h3>", text, "</h3>"]

  def as_html(%Heading{level: 4, text: text}, _link_resolver, _html_serializer),
    do: ["<h4>", text, "</h4>"]

  def as_html(%Heading{level: 5, text: text}, _link_resolver, _html_serializer),
    do: ["<h5>", text, "</h5>"]

  def as_html(%Heading{level: 6, text: text}, _link_resolver, _html_serializer),
    do: ["<h6>", text, "</h6>"]
end
