{-# LANGUAGE ForeignFunctionInterface #-}
module Counter where
import Foreign.JNI
import Foreign.JNI.Lookup

foreign export ccall helloWorld :: IO ()
helloWorld :: IO ()
helloWorld = putStrLn "Hello world"

foreign export ccall "Java_org_haskell_HaskellActivity_onCreateHS" onCreate :: JNIEnv -> JObject -> JObject -> IO ()
onCreate :: JNIEnv -> JObject -> JObject -> IO ()
onCreate env activity _bundle = helloWorld

