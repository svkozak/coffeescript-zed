; CoffeeScript syntax highlighting for custom tree-sitter-coffeescript grammar
; Only includes operators and node types that actually exist in the grammar

; Comments
(comment) @comment

; Strings
(string) @string

; Numbers
(number) @number

; Identifiers
(identifier) @variable

; Booleans
(boolean) @constant.builtin
"true" @constant.builtin
"false" @constant.builtin

; Keywords (based on what's in the grammar)
"class" @keyword.type
"extends" @keyword.type
"if" @keyword.conditional
"else" @keyword.conditional
"for" @keyword.control
"while" @keyword.control
"return" @keyword.control

; Function arrows (CoffeeScript-specific!)
"->" @operator
"=>" @operator

; Assignment operators (from assignment_statement)
"=" @operator
"+=" @operator
"-=" @operator
"*=" @operator
"/=" @operator
"%=" @operator
"||=" @operator
"&&=" @operator

; Binary expression operators (only those defined in binary_expression)
"+" @operator
"-" @operator
"*" @operator
"/" @operator
"==" @operator
"!=" @operator
"&&" @operator
"||" @operator

; Unary operators
"!" @operator

; Punctuation (only tokens that exist in the grammar)
"(" @punctuation.bracket
")" @punctuation.bracket
"[" @punctuation.bracket
"]" @punctuation.bracket
"{" @punctuation.bracket
"}" @punctuation.bracket
"," @punctuation.delimiter
";" @punctuation.delimiter
":" @punctuation.delimiter