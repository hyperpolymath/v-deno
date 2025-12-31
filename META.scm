;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; META.scm — v-deno

(define-module (v-deno meta)
  #:export (architecture-decisions development-practices design-rationale))

(define architecture-decisions
  '((adr-001
     (title . "Thin FFI Wrapper")
     (status . "accepted")
     (date . "2025-12-31")
     (context . "Deno.dlopen already handles FFI, need V-specific conveniences")
     (decision . "Wrap Deno.dlopen with V-aware type mappings and utilities")
     (consequences . ("Low overhead" "V string/array handling" "Callback management")))

    (adr-002
     (title . "V Compiles to C ABI")
     (status . "accepted")
     (date . "2025-12-31")
     (context . "V outputs C code, Deno FFI expects C ABI")
     (decision . "Leverage V's @[export] attribute for clean C ABI exports")
     (consequences . ("Native compatibility" "No runtime needed" "Static linking possible")))

    (adr-003
     (title . "Optional Build Integration")
     (status . "proposed")
     (date . "2025-12-31")
     (context . "Users may want to compile V from Deno workflow")
     (decision . "Provide optional V compilation via Deno.Command")
     (consequences . ("Streamlined workflow" "Requires V installed" "Cross-compilation support")))))

(define development-practices
  '((code-style
     (languages . ("TypeScript" "V"))
     (formatter . ("deno fmt" "v fmt"))
     (linter . "deno lint"))
    (security
     (sast . "CodeQL")
     (memory . "Document unsafe operations"))
    (testing
     (framework . "Deno.test")
     (integration . "Requires V compiler")
     (coverage-minimum . 80))
    (versioning
     (scheme . "SemVer 2.0.0"))))

(define design-rationale
  '((why-v
     "V is simple, fast to compile, and produces clean C ABI. Perfect for FFI.")
    (why-not-wasm
     "V can compile to WASM, but native FFI is faster and supports more features.")
    (why-callbacks
     "Bidirectional FFI enables V libraries to notify Deno of events.")))
