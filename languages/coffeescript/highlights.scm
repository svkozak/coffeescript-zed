; CoffeeScript syntax highlighting for custom tree-sitter-coffeescript grammar
; Includes all operators and node types from the grammar

; Comments
(comment) @comment

; Strings
(string) @string
(double_quoted_string) @string
(single_quoted_string) @string
(heredoc_string) @string

; Numbers
(number) @number
(decimal_number) @number
(hex_number) @number
(binary_number) @number
(octal_number) @number

; Identifiers
(identifier) @variable

; Instance variables
(instance_variable) @variable

; Booleans
(boolean) @constant.builtin
"true" @constant.builtin
"false" @constant.builtin

; Keywords
"class" @keyword.type
"extends" @keyword.type
"if" @keyword.conditional
"else" @keyword.conditional
"unless" @keyword.conditional
"for" @keyword.control
"while" @keyword.control
"until" @keyword.control
"loop" @keyword.control
"return" @keyword.control
"yield" @keyword.control
"var" @keyword
"async" @keyword
"new" @keyword
"delete" @keyword
"typeof" @keyword
"await" @keyword
"super" @keyword

; Function arrows
"->" @operator
"=>" @operator

; Assignment operators
"=" @operator
"+=" @operator
"-=" @operator
"*=" @operator
"/=" @operator
"%=" @operator
"||=" @operator
"&&=" @operator

; Binary operators
"+" @operator
"-" @operator
"*" @operator
"/" @operator
"<<" @operator
">>" @operator
">>>" @operator
"&" @operator
"^" @operator
"|" @operator
"==" @operator
"!=" @operator
"is" @operator
"isnt" @operator
"&&" @operator
"and" @operator
"||" @operator
"or" @operator
"::" @operator

; Unary operators
"!" @operator
"not" @operator
"~" @operator
"-" @operator

; Instance variable operator
"@" @operator

; Member access
(member_expression
  "." @operator)

; Punctuation
"(" @punctuation.bracket
")" @punctuation.bracket
"[" @punctuation.bracket
"]" @punctuation.bracket
"{" @punctuation.bracket
"}" @punctuation.bracket
"," @punctuation.delimiter
";" @punctuation.delimiter
":" @punctuation.delimiter

; Embedded JS punctuation
"`" @punctuation.delimiter

; JSX punctuation
"<" @punctuation.bracket
">" @punctuation.bracket

; Specific constructs
(regex) @string.regex
(single_line_regex) @string.regex
(multi_line_regex) @string.regex
(embedded_js) @string
(jsx_element) @tag
(jsx_attribute) @attribute
(interpolation) @embedded