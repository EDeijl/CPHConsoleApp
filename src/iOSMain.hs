{-# LANGUAGE ForeignFunctionInterface #-}
module HaskellActivity where
import HelloWorld

foreign export ccall  onCreate ::  IO ()
onCreate ::  IO ()
onCreate = putStrLn helloWorld

