; CoffeeScript indentation rules (all node types from the grammar)

; Increase indent after:
(if_statement) @indent
(unless_statement) @indent
(for_statement) @indent
(while_statement) @indent
(until_statement) @indent
(loop_statement) @indent
(function_definition) @indent
(class_definition) @indent
(object) @indent
(array) @indent
(block) @indent

; Decrease indent for closing
"}" @outdent
"]" @outdent
")" @outdent