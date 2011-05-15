class TBBC
    def coderay(input)	
		input=input.gsub("\r","")
		scan=input.scan(/\[code lang=(.+?)\](.+?)\[\/code\]/m)
		scan.each do |splits|
			parse=splits[1].gsub("&lt;","<").gsub("&gt;",">")
			lang=splits[0]
			parsed="[nobbc]" + CodeRay.scan(parse, lang).div(:line_numbers => @config[:syntax_highlighting_line_numbers], :css => :class) + "[/nobbc]"
			input=input.gsub("[code lang=#{lang}]#{splits[1]}[/code]",parsed)
		end
		coderay_styled(input)
	end
	
	def coderay_styled(input)
	    output = input.gsub(/class="CodeRay"/,"style=\"background-color: #232323; border: 1px solid black; font-family: 'Courier New', 'Terminal', monospace; color: #E6E0DB; padding: 3px 5px; overflow: auto; font-size: 12px; margin: 12px 0;\"")
		output = output.gsub(/<pre>/,"<pre style=\"margin: 0px; padding: 0px;\">")
		output = output.gsub(/class="an"/,"style=\"#{@config[:syntax_highlighting_html]}\"").gsub(/class="c"/,"style=\"#{@config[:syntax_highlighting_comment]}\"")
		output = output.gsub(/class="ch"/,"style=\"#{@config[:syntax_highlighting_escaped]}\"").gsub(/class="cl"/,"style=\"#{@config[:syntax_highlighting_class]}\"")
		output = output.gsub(/class="co"/,"style=\"#{@config[:syntax_highlighting_constant]}\"").gsub(/class="fl"/,"style=\"#{@config[:syntax_highlighting_float]}\"")
		output = output.gsub(/class="fu"/,"style=\"#{@config[:syntax_highlighting_function]}\"").gsub(/class="gv"/,"style=\"#{@config[:syntax_highlighting_global]}\"")
		output = output.gsub(/class="i"/,"style=\"#{@config[:syntax_highlighting_integer]}\"").gsub(/class="il"/,"style=\"#{@config[:syntax_highlighting_inline]}\"")
		output = output.gsub(/class="iv"/,"style=\"#{@config[:syntax_highlighting_instance]}\"").gsub(/class="pp"/,"style=\"#{@config[:syntax_highlighting_doctype]}\"")
		output = output.gsub(/class="r"/,"style=\"#{@config[:syntax_highlighting_keyword]}\"").gsub(/class="rx"/,"style=\"#{@config[:syntax_highlighting_regex]}\"")
		output = output.gsub(/class="s"/,"style=\"#{@config[:syntax_highlighting_string]}\"").gsub(/class="sy"/,"style=\"#{@config[:syntax_highlighting_symbol]}\"")
		output = output.gsub(/class="ta"/,"style=\"#{@config[:syntax_highlighting_html]}\"").gsub(/class="pc"/,"style=\"#{@config[:syntax_highlighting_boolean]}\"")
    end
end