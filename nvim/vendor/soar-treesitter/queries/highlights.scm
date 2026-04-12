; Keywords
"sp" @keyword
"gp" @keyword
(state_keyword) @keyword
"-->" @operator

; Type flags
(type_flag) @attribute

; Rule name
(rule_name) @function

; Documentation string
(doc_string) @comment

; Comments
(comment) @comment

; Variables: <s>, <x>, <var>
(variable) @variable

; Constants
(bareword) @string
(pipe_string) @string
(integer) @number
(float) @number

; Attribute marker
"^" @operator
"-^" @operator

; Predicate operators
"<>" @operator
"<=>" @operator
"<=" @operator
">=" @operator
"<" @operator
">" @operator
"@" @operator
"@+" @operator
"@-" @operator
"!@" @operator

; Disjunction
"<<" @punctuation.bracket
">>" @punctuation.bracket

; Conjunction
"{" @punctuation.bracket
"}" @punctuation.bracket

; Value list (gp)
"[" @punctuation.bracket
"]" @punctuation.bracket

; Preference symbols
(pref_acceptable) @operator
(pref_reject) @operator
(pref_prohibit) @operator
(pref_require) @operator
(pref_better) @operator
(pref_worse) @operator
(pref_indifferent) @operator
(acceptable_marker) @operator

; Built-in functions
(fn_add) @function.builtin
(fn_sub) @function.builtin
(fn_mul) @function.builtin
(fn_div) @function.builtin
(fn_mod) @function.builtin
(fn_lti) @function.builtin

"abs" @function.builtin
"sqrt" @function.builtin
"max" @function.builtin
"min" @function.builtin
"round-off" @function.builtin
"round-off-heading" @function.builtin
"compute-heading" @function.builtin
"compute-range" @function.builtin
"int" @function.builtin
"float" @function.builtin
"ifeq" @function.builtin
"concat" @function.builtin
"strlen" @function.builtin
"capitalize-symbol" @function.builtin
"trim" @function.builtin
"set-count" @function.builtin
"set-sum" @function.builtin
"set-multiply" @function.builtin
"set-min" @function.builtin
"set-max" @function.builtin
"set-range" @function.builtin
"set-mean" @function.builtin
"set-stdev" @function.builtin
"make-constant-symbol" @function.builtin
"rand-int" @function.builtin
"rand-float" @function.builtin
"deep-copy" @function.builtin
"size" @function.builtin
"dc" @function.builtin
"timestamp" @function.builtin
"crlf" @function.builtin
"write" @function.builtin

; Control actions
"halt" @keyword
"interrupt" @keyword
"link-stm-to-ltm" @function.builtin

; Punctuation
"(" @punctuation.bracket
")" @punctuation.bracket
"." @punctuation.delimiter
