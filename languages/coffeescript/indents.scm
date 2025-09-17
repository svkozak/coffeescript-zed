; CoffeeScript indentation rules (only node types that exist in the grammar)

; Increase indent after:
(if_statement) @indent
(for_statement) @indent  
(while_statement) @indent
(function_definition) @indent
(class_definition) @indent
(object) @indent
(array) @indent

; Decrease indent for closing
"}" @outdent
"]" @outdent
")" @outdent