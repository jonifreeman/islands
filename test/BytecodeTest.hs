module Test.Islands.Bytecode where

import Test.HUnit
import System.IO
import qualified Data.ByteString.Lazy as L
import Islands.Bytecode

-- Run tests manually (until we have a proper build file):
-- :l src/Opcodes.hs src/BytecodeParser.hs test/BytecodeTest.hs
-- :m Test.HUnit Test.Islands.Bytecode
-- runTestTT tests

tests = TestList [ TestLabel "Parses Java class" parseJavaClassTest
                 , TestLabel "Parses Java interface" parseJavaInterfaceTest ]


-- FIXME assert
parseJavaClassTest = TestCase (do clazz <- parseFile "test/JavaClass.class" 
                                  assertEqual "fqn" (fqn clazz) "test/JavaClass")

-- FIXME actual test
parseJavaInterfaceTest = TestCase (do clazz <- parseFile "test/JavaInterface.class" 
                                      (putStrLn . show) clazz)

parseFile name = do contents <- L.readFile name
                    return (parse contents)