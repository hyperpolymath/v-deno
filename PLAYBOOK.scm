;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;; PLAYBOOK.scm — v-deno

(define-module (v-deno playbook)
  #:export (workflows runbooks procedures))

(define workflows
  '((development
     (setup
      (steps
       ("Clone repository" . "git clone https://github.com/hyperpolymath/v-deno")
       ("Enter directory" . "cd v-deno")
       ("Install V" . "git clone https://github.com/vlang/v && cd v && make")
       ("Run tests" . "deno test")
       ("Format code" . "deno fmt && v fmt examples/")))
     (daily
      (steps
       ("Pull latest" . "git pull origin main")
       ("Run tests" . "deno test")
       ("Check types" . "deno check src/mod.ts"))))

    (release
     (prepare
      (steps
       ("Update version in deno.json" . "manual")
       ("Update CHANGELOG.adoc" . "manual")
       ("Run full test suite" . "deno test --coverage")
       ("Build example libraries" . "v -shared examples/*.v")))
     (publish
      (steps
       ("Create git tag" . "git tag vX.Y.Z")
       ("Push with tags" . "git push origin main --tags")
       ("Publish to JSR" . "deno publish"))))))

(define runbooks
  '((incident-response
     (ffi-crash
      (symptoms . ("Segmentation fault" "Memory corruption" "Deno process crash"))
      (diagnosis . ("Check V function signatures" "Verify pointer handling" "Review memory ownership"))
      (resolution . ("Fix V code" "Add null checks" "Use safe wrappers"))
      (prevention . ("Comprehensive FFI tests" "Memory sanitizer in CI")))

     (library-load-failure
      (symptoms . ("Cannot load shared library" "Symbol not found"))
      (diagnosis . ("Check library path" "Verify export annotations" "Check ABI compatibility"))
      (resolution . ("Rebuild V library" "Add missing exports" "Fix linker flags"))
      (prevention . ("CI builds on all platforms" "Symbol verification tests")))

     (callback-deadlock
      (symptoms . ("Deno hangs" "No response from V callback"))
      (diagnosis . ("Check callback registration" "Verify thread safety"))
      (resolution . ("Fix callback implementation" "Add timeout handling"))
      (prevention . ("Callback timeout defaults" "Deadlock detection"))))))

(define procedures
  '((creating-v-library
     (description . "How to create a V library callable from Deno")
     (steps
      ("Create V source file" . "touch mylib.v")
      ("Add export annotations" . "@[export: 'function_name']")
      ("Write functions" . "pub fn my_function(args) type { ... }")
      ("Compile to shared library" . "v -shared mylib.v -o libmylib.so")
      ("Define Deno symbols" . "{ function_name: { parameters: [...], result: ... } }")
      ("Load in Deno" . "const lib = await VLibrary.load('./libmylib.so', symbols)")))

    (handling-v-strings
     (description . "How to pass strings between Deno and V")
     (steps
      ("V side: use C strings" . "@[export] fn greet(name &char) &char")
      ("Deno side: encode" . "const encoded = new TextEncoder().encode(str)")
      ("Pass to V" . "lib.greet(encoded)")
      ("V returns" . "Return &char from V function")
      ("Deno side: decode" . "new TextDecoder().decode(result)")))

    (setting-up-callbacks
     (description . "How to enable V to call back into Deno")
     (steps
      ("Define callback type in V" . "type Callback = fn(int) int")
      ("Export function accepting callback" . "@[export] fn register_callback(cb Callback)")
      ("Create Deno callback" . "const callback = new Deno.UnsafeCallback({ ... })")
      ("Register callback" . "lib.register_callback(callback.pointer)")
      ("Handle calls" . "V calls trigger Deno callback")
      ("Cleanup" . "callback.close() when done")))))
