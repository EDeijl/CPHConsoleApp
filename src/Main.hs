{-# LANGUAGE ForeignFunctionInterface #-}
module Main where
import Control.Concurrent
import Control.Monad

foreign export ccall startCounter :: Int -> IO ()
startCounter :: Int -> IO ()
startCounter = void . forkIO . void . loop
  where loop i = do
    putStrLn (replicate i 'o')
    threadDelay (10^6)
    loop (i + 1)
