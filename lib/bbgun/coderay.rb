module BBGun
  module Coderay
    def self.parse(input)
      input=input.gsub("\r","")
      scan=input.scan(/\[code lang=(.+?)\](.+?)\[\/code\]/m)
      scan.each do |splits|
        parse=splits[1].gsub("&lt;","<").gsub("&gt;",">")
        lang=splits[0]
        parsed="[nobbc]" + CodeRay.scan(parse, lang).div(:line_numbers => @config[:syntax_highlighting_line_numbers], :css => :class) + "[/nobbc]"
        input=input.gsub("[code lang=#{lang}]#{splits[1]}[/code]",parsed)
      end
      out = coderay_styled(input)
      return out.to_s
	  end
	
	  def self.coderay_styled(input)
      output = input.gsub(/class="CodeRay"/,"style=\"background-color: #232323; border: 1px solid black; font-family: 'Courier New', 'Terminal', monospace; color: #E6E0DB; padding: 3px 5px; overflow: auto; font-size: 12px; margin: 12px 0;\"")
      output = output.gsub(/<pre>/,"<pre style=\"margin: 0px; padding: 0px;\">")
      output = output.gsub(/class="an"/,"style=\"#{BBGun.config.syntax_highlighting_html}\"").gsub(/class="c"/,"style=\"#{BBGun.config.syntax_highlighting_comment}\"")
      output = output.gsub(/class="ch"/,"style=\"#{BBGun.config.syntax_highlighting_escaped}\"").gsub(/class="cl"/,"style=\"#{BBGun.config.syntax_highlighting_class}\"")
      output = output.gsub(/class="co"/,"style=\"#{BBGun.config.syntax_highlighting_constant}\"").gsub(/class="fl"/,"style=\"#{BBGun.config.syntax_highlighting_float}\"")
      output = output.gsub(/class="fu"/,"style=\"#{BBGun.config.syntax_highlighting_function}\"").gsub(/class="gv"/,"style=\"#{BBGun.config.syntax_highlighting_global}\"")
      output = output.gsub(/class="i"/,"style=\"#{BBGun.config.syntax_highlighting_integer}\"").gsub(/class="il"/,"style=\"#{BBGun.config.syntax_highlighting_inline}\"")
      output = output.gsub(/class="iv"/,"style=\"#{BBGun.config.syntax_highlighting_instance}\"").gsub(/class="pp"/,"style=\"#{BBGun.config.syntax_highlighting_doctype}\"")
      output = output.gsub(/class="r"/,"style=\"#{BBGun.config.syntax_highlighting_keyword}\"").gsub(/class="rx"/,"style=\"#{BBGun.config.syntax_highlighting_regex}\"")
      output = output.gsub(/class="s"/,"style=\"#{BBGun.config.syntax_highlighting_string}\"").gsub(/class="sy"/,"style=\"#{BBGun.config.syntax_highlighting_symbol}\"")
      output = output.gsub(/class="ta"/,"style=\"#{BBGun.config.syntax_highlighting_html}\"").gsub(/class="pc"/,"style=\"#{BBGun.config.syntax_highlighting_boolean}\"")
    end
    end
end