{-# LANGUAGE ForeignFunctionInterface #-}
module Counter where

foreign export ccall "Java_org_haskell_Counter_helloWorld" helloWorld :: IO ()
helloWorld :: IO ()
helloWorld = putStrLn "Hello world"

