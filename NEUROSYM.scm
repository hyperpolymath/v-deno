;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;; NEUROSYM.scm — v-deno

(define-module (v-deno neurosym)
  #:export (cognitive-patterns symbolic-structures reasoning-modes))

(define cognitive-patterns
  '((thin-wrapper
     (pattern . "Minimal abstraction over Deno.dlopen")
     (rationale . "V produces clean C ABI, no need for heavy translation")
     (application . ("Direct symbol mapping" "Transparent type conversion"))
     (anti-patterns . ("Runtime abstraction layers" "Object-oriented wrappers")))

    (explicit-memory
     (pattern . "Memory ownership always explicit")
     (rationale . "FFI memory bugs are subtle and dangerous")
     (application . ("Documented ownership" "Clear cleanup APIs"))
     (anti-patterns . ("Implicit garbage collection" "Hidden allocations")))

    (v-idiomatic
     (pattern . "Examples follow V best practices")
     (rationale . "V developers should feel at home")
     (application . ("@[export] annotations" "V naming conventions"))
     (anti-patterns . ("C-style V code" "Unnecessary complexity")))))

(define symbolic-structures
  '((ffi-types
     (primitives . ("i8" "i16" "i32" "i64" "u8" "u16" "u32" "u64" "f32" "f64"))
     (pointers . ("pointer" "buffer"))
     (special . ("void" "function")))

    (v-to-ffi-mapping
     (int . "i32")
     (i64 . "i64")
     (f32 . "f32")
     (f64 . "f64")
     (bool . "i8")
     (char . "u8")
     (string . "pointer")
     (array . "pointer + length"))

    (memory-ownership
     (deno-owned . "Allocated by Deno, freed by Deno")
     (v-owned . "Allocated by V, freed by V")
     (shared . "Explicit transfer of ownership")
     (static . "Lifetime of library"))))

(define reasoning-modes
  '((type-mapping
     (mode . "Bidirectional type analysis")
     (process . ("Identify V type" "Find FFI equivalent" "Document conversion"))
     (validation . "Round-trip preserves value"))

    (safety-reasoning
     (mode . "Defensive by default")
     (process . ("Assume invalid input" "Add checks" "Document preconditions"))
     (validation . "No crashes on malformed input"))

    (callback-reasoning
     (mode . "Lifetime-aware design")
     (process . ("Determine callback lifetime" "Register safely" "Cleanup properly"))
     (validation . "No use-after-free, no leaks"))))
