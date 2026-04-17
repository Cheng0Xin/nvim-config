;; Highlights file for Move

;; Types
(type_parameters) @type
(type_parameter) @type
(type_parameter_identifier) @type
(apply_type) @type
(ref_type) @type.ref
(primitive_type) @type.builtin

;; Comments
(line_comment) @comment
(block_comment) @comment

;; Annotations
(annotation) @annotation
(annotation_item) @annotation.item

;; Constants
(constant name: (constant_identifier) @constant.name)
(constant expr: (num_literal) @constant.value)
((identifier) @constant.name
  (#match? @constant.name "^[A-Z][A-Z\\d_]+$"))

;; Function definitions
(function_definition
  name: (function_identifier) @function)
(macro_function_definition
  name: (function_identifier) @macro)
(native_function_definition
  name: (function_identifier) @function)
(usual_spec_function
  name: (function_identifier) @function)
(function_parameter
  name: (variable_identifier) @variable.parameter)

;; Module definitions
(module_identity
  address: (module_identifier) @namespace)
(module_identity
  module: (module_identifier) @module)

((identifier) @keyword
  (#eq? @keyword "extend")
  (#has-ancestor? module_extension_definition))

;; Function calls
(call_expression
  (name_expression
    access: (module_access
      module: (module_identifier) @namespace)))

(call_expression
  (name_expression
    access: (module_access
      member: (identifier) @function.call)))

(label (identifier) @label)

;; Macro calls
(macro_call_expression
  access: (macro_module_access) @macro.call)

;; Literals
(num_literal) @number
(bool_literal) @boolean
(hex_string_literal) @string
(byte_string_literal) @string
(address_literal) @number

;; Uses
(use_member member: (identifier) @include)
(use_module alias: (module_identifier) @module)
(use_fun (module_access module: (module_identifier) @namespace))
(use_fun (module_access member: (identifier) @include))
(function_identifier) @function

;; Structs
(struct_definition name: (struct_identifier) @type)
(ability) @attribute
(field_annotation field: (field_identifier) @property)
(field_identifier) @property

;; Enums
(enum_definition name: (enum_identifier) @type)
(variant variant_name: (variant_identifier) @constructor)

;; Packs / module access
(pack_expression
  (name_expression access: (module_access) @constructor))

(bind_unpack (name_expression) @type)

(module_access "$" (identifier) @variable.special)
"$" @variable.special

(module_access
  module: (module_identifier)
  member: (identifier) @constructor)

(abort_expression) @keyword
(mut_ref) @keyword

;; Operators
(binary_operator) @operator
(unary_op) @operator
"=>" @operator
"@" @operator
"->" @operator

;; Specs
(spec_block target: (identifier) @function)
(spec_pragma) @attribute
(spec_condition kind: (condition_kind) @keyword)
(condition_properties) @attribute

[ "pragma" ] @keyword

;; Source language keywords
[
  "fun"
  "return"
  "if"
  "else"
  "while"
  "native"
  "struct"
  "use"
  "public"
  "package"
  "module"
  "abort"
  "const"
  "let"
  "has"
  "as"
  "&"
  "friend"
  "entry"
  "mut"
  "macro"
  "enum"
  "break"
  "continue"
  "loop"
] @keyword

"match" @keyword
