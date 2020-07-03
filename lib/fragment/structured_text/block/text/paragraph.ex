alias Prismic.Fragment.StructuredText.Block

defmodule Block.Text.Paragraph do
  @type t :: %__MODULE__{text: String.t(), spans: [Span.t()], label: String.t()}

  defstruct [:text, :label, spans: []]
end

defimpl Block, for: Block.Text.Paragraph do
  alias Block.Text.Paragraph

  def as_html(%Paragraph{text: text}, _link_resolver, _html_serializer),
    do: ["<p>", text, "</p>"]
end
