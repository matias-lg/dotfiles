; extends

(assignment 
    left: (identifier) @_id
    right: (string (string_content) @injection.content)
    (#match? @_id "hx")
    (#set! injection.language "htmldjango"))
