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

; Booleans and nil
(boolean) @constant.builtin
"true" @constant.builtin
"false" @constant.builtin
"yes" @constant.builtin
"on" @constant.builtin
"no" @constant.builtin
"off" @constant.builtin

; Null and undefined
(null_literal) @constant.builtin
(undefined_literal) @constant.builtin

; Keywords
"class" @keyword.type
"extends" @keyword.type
"if" @keyword.conditional
"else" @keyword.conditional
"unless" @keyword.conditional
"switch" @keyword.control
"when" @keyword.control
"try" @keyword.control
"catch" @keyword.control
"finally" @keyword.control
"throw" @keyword.control
"do" @keyword.control
"for" @keyword.control
"own" @keyword.control
"by" @keyword.control
; Note: "in" and "of" are not highlighted as bare strings to avoid matching inside identifiers (e.g., "index", "softof")
; This is a known limitation - they would need grammar-level changes to be highlighted without false positives
"while" @keyword.control
"until" @keyword.control
"loop" @keyword.control
"return" @keyword.control
"yield" @keyword.control
"then" @keyword.control
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
"?=" @operator

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
"instanceof" @operator
"&&" @operator
"||" @operator
"::" @operator

; Word operators (must be in binary_expression context to avoid matching inside identifiers)
(binary_expression
  "and" @operator)
(binary_expression
  "or" @operator)

; Note: "is" and "isnt" are not highlighted to avoid false positives with identifiers like "this", "class", "listen"
; These operators match substrings too easily. Would need grammar-level changes to properly highlight without false positives.

; Range operators
".." @operator
"..." @operator

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

; Existential operators
(existential_check
  "?" @operator)
(existential_member_expression
  "?." @operator)
(existential_function_call
  "?." @operator)

; Method definitions
(method_definition
  (identifier) @function.method
  ":" @operator)

; Break and continue statements
(break_statement) @keyword.control
(continue_statement) @keyword.control

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