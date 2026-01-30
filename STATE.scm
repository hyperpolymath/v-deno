;;; STATE.scm — v-deno
;; SPDX-License-Identifier: PMPL-1.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

(define metadata
  '((version . "0.1.0")
    (schema-version . "1.0")
    (created . "2025-12-31")
    (updated . "2025-12-31")
    (project . "v-deno")
    (repo . "https://github.com/hyperpolymath/v-deno")))

(define project-context
  '((name . "v-deno")
    (tagline . "V programming language FFI for Deno")
    (tech-stack . ("TypeScript" "V" "FFI"))))

(define current-position
  '((phase . "v0.1 - Foundation")
    (overall-completion . 5)
    (components
      ((ffi-wrapper ((status . "planned") (completion . 0)))
       (type-mappings ((status . "planned") (completion . 0)))
       (callback-support ((status . "planned") (completion . 0)))
       (memory-utils ((status . "planned") (completion . 0)))
       (build-integration ((status . "planned") (completion . 0)))
       (documentation ((status . "in-progress") (completion . 30)))))
    (working-features ())))

(define route-to-mvp
  '((milestones
      ((v0.1.0
         (name . "Basic FFI")
         (status . "planned")
         (items
           ("VLibrary.load() wrapper" . pending)
           ("Type mapping (i32, f64, pointer)" . pending)
           ("String handling" . pending)
           ("Example V library" . pending)))
       (v0.2.0
         (name . "Callbacks")
         (status . "planned")
         (items
           ("VCallback.create()" . pending)
           ("Pointer passing" . pending)
           ("Callback cleanup" . pending)))
       (v0.3.0
         (name . "Build Integration")
         (status . "planned")
         (items
           ("Compile V from Deno" . pending)
           ("Cross-platform builds" . pending)
           ("Hot reload" . pending)))))))

(define blockers-and-issues
  '((critical ())
    (high-priority
      (("V string encoding" . "V strings vs C strings vs Deno strings")))
    (medium-priority
      (("V array handling" . "Dynamic arrays need special treatment")))
    (low-priority ())))

(define critical-next-actions
  '((immediate
      (("Implement VLibrary wrapper" . high)
       ("Create example V library" . high)))
    (this-week
      (("Add type mapping tests" . medium)))
    (this-month
      (("Callback support" . medium)))))

(define session-history
  '((snapshots
      ((date . "2025-12-31")
       (session . "initial-setup")
       (accomplishments ("Created repository" "Added README.adoc"))
       (notes . "Project scaffolding")))))

(define state-summary
  '((project . "v-deno")
    (completion . 5)
    (blockers . 0)
    (phase . "Foundation")
    (updated . "2025-12-31")))
