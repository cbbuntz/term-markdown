module SuperScript
  def superscript(str)
    str.gsub!(/\A\(|\)\Z/,'')
    str
      .tr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'ᴬᴮcᴰᴱfᴳᴴᴵᴶᴷᴸᴹᴺᴼᴾqᴿsᵀᵁⱽᵂxyz')
      .tr('abcdefghijklmnopqrstuvwxyz','ᵃᵇᶜᵈᵉᶠᵍʰⁱʲᵏˡᵐⁿᵒᵖqʳˢᵗᵘᵛʷˣʸᶻ')
      .tr('0123456789', '⁰¹²³⁴⁵⁶⁷⁸⁹')
      .tr('+', "⁺")  # only works when done a character at a time
      .tr('-', "⁻")  # each_codepoint or each_grapheme_cluster
      .tr('=', "⁼")  # might help
      .tr('(', "⁽")  
      .tr(')', "⁾")  
  end

  def subscript(str)
    str
      .tr('123456789+-=()', '₀₁₂₃₄₅₆₇₈₉₊₋₌₍₎')
      .tr('abcdefghijklmnopqrstuvwxyz','ₐbcdₑₒₓₔₕₖₗₘₙₚₛₜuvwxyz')
  end

  def caret_split(str)
    m = /(?<!\\)(\^)(?=\S)/.match(str)
    [$`, $&, $']
  end

  def superscript_split(str)
    /(^(?<paren>\([^()]*\g<paren>*[^()]*\)))  # scan for matching pares
    |\S+                                      # else scan until space or end
    /xm.match(str)
    [$&, $']
  end

  def process_superscript(str)
    pre, caret, post = caret_split(str)
    
    return str unless post
    
    ss, ss_post = superscript_split(post)
    ss = superscript(ss)
    ss_post = process_superscript(ss_post)
    
    [pre, ss, ss_post] * ''
  end
end
