; CoffeeScript indentation rules (all node types from the grammar)

; Increase indent after:
(if_statement) @indent
(unless_statement) @indent
(switch_statement) @indent
(when_clause) @indent
(for_statement) @indent
(while_statement) @indent
(until_statement) @indent
(loop_statement) @indent
(try_statement) @indent
(catch_clause) @indent
(finally_clause) @indent
(throw_statement) @indent
(do_block) @indent
(function_definition) @indent
(method_definition) @indent
(class_definition) @indent
(object) @indent
(array) @indent
(block) @indent

; Decrease indent for closing
"}" @outdent
"]" @outdent
")" @outdent