;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;; AGENTIC.scm — v-deno

(define-module (v-deno agentic)
  #:export (agent-capabilities autonomy-levels decision-boundaries))

(define agent-capabilities
  '((ffi-wrapper
     (description . "Agent can work on FFI wrapper implementation")
     (scope . ("Type mappings" "Symbol loading" "Error handling"))
     (limitations . ("Cannot test without V compiler" "Platform-specific concerns")))

    (v-examples
     (description . "Agent can write V code examples")
     (scope . ("Simple functions" "Struct definitions" "Export annotations"))
     (limitations . ("Limited V expertise" "Complex V patterns need review")))

    (type-definitions
     (description . "Agent can create TypeScript type definitions")
     (scope . ("FFI types" "Return types" "Callback signatures"))
     (limitations . ("Must match V ABI" "Platform differences")))

    (memory-utilities
     (description . "Agent can implement memory management helpers")
     (scope . ("Buffer handling" "String conversion" "Array marshalling"))
     (limitations . ("Memory safety critical" "Requires thorough testing")))))

(define autonomy-levels
  '((level-1-autonomous
     (actions . ("Format code" "Add type definitions" "Write documentation" "Simple tests"))
     (approval . "none"))

    (level-2-supervised
     (actions . ("Implement type mappings" "Add V examples" "Callback utilities"))
     (approval . "human-review"))

    (level-3-restricted
     (actions . ("Modify FFI loading" "Change memory handling" "Pointer operations"))
     (approval . "explicit-request"))

    (level-4-prohibited
     (actions . ("Unsafe pointer casts" "Disable safety checks" "Platform-specific hacks"))
     (approval . "never-autonomous"))))

(define decision-boundaries
  '((technical-decisions
     (agent-decides . ("Type mapping details" "Helper function design" "Example structure"))
     (human-decides . ("Public API" "Memory ownership model" "Platform support")))

    (safety-decisions
     (agent-decides . ("Null check placement" "Error message content"))
     (human-decides . ("Unsafe operation exposure" "Memory management strategy" "ABI stability")))

    (v-language-decisions
     (agent-decides . ("Example code style" "Test V code"))
     (human-decides . ("V idioms" "Complex V patterns" "V version compatibility")))))
