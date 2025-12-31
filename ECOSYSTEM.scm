;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;; ECOSYSTEM.scm — v-deno

(ecosystem
  (version "0.1.0")
  (name "v-deno")
  (type "library")
  (purpose "V programming language FFI bridge for Deno")

  (position-in-ecosystem
    "Enables V language integration with Deno via FFI. Part of hyperpolymath's
     Deno-as-hub infrastructure. Complements Zig-based FFI with V's simpler
     syntax and faster compilation.")

  (related-projects
    (project (name "bundeno")
             (url "https://github.com/hyperpolymath/bundeno")
             (relationship "sibling-bridge"))
    (project (name "deno-bunbridge")
             (url "https://github.com/hyperpolymath/deno-bunbridge")
             (relationship "sibling-bridge"))
    (project (name "beamdeno")
             (url "https://github.com/hyperpolymath/beamdeno")
             (relationship "sibling-bridge"))
    (project (name "deno")
             (url "https://deno.land")
             (relationship "runtime"))
    (project (name "vlang")
             (url "https://vlang.io")
             (relationship "target-language")))

  (what-this-is
    "- Wrapper around Deno.dlopen for V libraries"
    "- V-aware type mappings (strings, arrays, structs)"
    "- Callback support for V→Deno communication"
    "- Optional V compilation from Deno"
    "- Memory management utilities")

  (what-this-is-not
    "- NOT a V runtime in JavaScript"
    "- NOT automatic V→JS transpilation"
    "- NOT for Zig (use Deno's native Zig FFI or Bun's Zig support)"))
