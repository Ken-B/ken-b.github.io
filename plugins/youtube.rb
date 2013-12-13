
<!-- saved from url=(0093)https://gist.github.com/serra/5574343/raw/f5cd9d75d093b0cbfecdd0d211d1d9ecc304af0a/youtube.rb -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><style type="text/css"></style><script>window["_GOOG_TRANS_EXT_VER"] = "1";</script></head><body><pre style="word-wrap: break-word; white-space: pre-wrap;">class YouTube &lt; Liquid::Tag
  Syntax = /^\s*([^\s]+)(\s+(\d+)\s+(\d+)\s*)?/

  def initialize(tagName, markup, tokens)
    super

    if markup =~ Syntax then
      @id = $1

      if $2.nil? then
          @width = 560
          @height = 420
      else
          @width = $2.to_i
          @height = $3.to_i
      end
    else
      raise "No YouTube ID provided in the \"youtube\" tag"
    end
  end

  def render(context)
    "&lt;iframe width=\"#{@width}\" height=\"#{@height}\" 
        allowfullscreen=\"allowfullscreen\"
        src=\"http://www.youtube.com/embed/#{@id}?color=white&amp;theme=light\"&gt; &lt;/iframe&gt;"
  end

  Liquid::Template.register_tag "youtube", self
end
</pre></body><style type="text/css">embed[type*="application/x-shockwave-flash"],embed[src*=".swf"],object[type*="application/x-shockwave-flash"],object[codetype*="application/x-shockwave-flash"],object[src*=".swf"],object[codebase*="swflash.cab"],object[classid*="D27CDB6E-AE6D-11cf-96B8-444553540000"],object[classid*="d27cdb6e-ae6d-11cf-96b8-444553540000"],object[classid*="D27CDB6E-AE6D-11cf-96B8-444553540000"]{	display: none !important;}</style></html>