{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ sources = [ "src/**/*.purs", "test/**/*.purs" ]
, name = "my-project"
, dependencies =
    [ "bigints"
    , "bouzuya-st"
    , "console"
    , "debug"
    , "effect"
    , "foreign-object"
    , "memoize"
    , "node-child-process"
    , "node-fs"
    , "node-path"
    , "node-process"
    , "numbers"
    , "precise"
    , "psci-support"
    , "rationals"
    , "test-unit"
    ]
, packages = ./packages.dhall
}
