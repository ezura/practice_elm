module Main exposing (add, output)

{-
   ezura:practice_elm ezura$ elm repl
   ---- Elm 0.19.0 ----------------------------------------------------------------
   Read <https://elm-lang.org/0.19.0/repl> to learn more: exit, help, imports, etc.
   --------------------------------------------------------------------------------
   > 1
   1 : number
   > 1+1
   2 : number
   > a = "hello"
   "hello" : String
   > a ++ "world"
   "helloworld" : String
   > String.length a
   5 : Int
   > String.reverse a
   "olleh" : String
   > 1 + \
   |   2
   3 : number
   > :exit
-}


output =
    "1 + 1 = " ++ String.fromInt (add 1 1)


{-| document comment
-}
add a b =
    a + b
