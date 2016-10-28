module Sprockets::Vue::Utils
  class << self
    def node_regex(tag)
      %r(
      \<#{tag}
      (\s+lang=["'](?<lang>\w+)["'])?
        \>
        (?<content>.+)
      \<\/#{tag}\>
      )mx
    end
  end
end
