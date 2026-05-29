;; Module declaration
(module_declaration
  name: (module_identity
    address: (identifier) @namespace
    module: (identifier) @module))

;; Use declarations
(use_declaration) @include

(use_module
  (module_identity
    address: (identifier) @namespace
    module: (identifier) @module))

(use_module_members
  (module_identity
    address: (identifier) @namespace
    module: (identifier) @module)
  (use_member
    member: (identifier) @variable
    (use_alias
      alias: (identifier) @variable)))

(use_module_members
  (use_member
    member: (identifier) @variable))

;; Structs
(struct_declaration
  name: (identifier) @type)

(ability) @keyword

(field_declaration
  name: (identifier) @property)

;; Functions
(function_declaration
  (entry_modifier) @keyword
  name: (identifier) @function)

(function_parameter
  name: (identifier) @variable.parameter)

;; Types
(primitive_type) @type.builtin

(apply_type
  (name_access_chain
    (identifier) @type))

(ref_type) @operator

(type_arguments) @type

;; Expressions
(let_expression
  binds: (bind_var
    (identifier) @variable))

(pack_expression
  type: (name_access_chain
    (identifier) @type))

(field_initializer
  field: (identifier) @property)

(call_expression
  function: (name_access_chain
    (identifier) @function))

(call_expression
  function: (name_access_chain
    (identifier) @namespace
    (identifier) @function))

(name_expression
  (name_access_chain
    (identifier) @variable))

(dot_expression
  object: (name_expression) @variable
  field: (identifier) @property)

(borrow_expression) @operator
