{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_to_do (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/zarkodencic/Documents/Coding/cli-to-do/.stack-work/install/x86_64-osx/2d7b235f9354174561257a75c468f753ed4441eea735fd7d701d2fafeca0478c/8.0.1/bin"
libdir     = "/Users/zarkodencic/Documents/Coding/cli-to-do/.stack-work/install/x86_64-osx/2d7b235f9354174561257a75c468f753ed4441eea735fd7d701d2fafeca0478c/8.0.1/lib/x86_64-osx-ghc-8.0.1/to-do-0.1.0.0"
datadir    = "/Users/zarkodencic/Documents/Coding/cli-to-do/.stack-work/install/x86_64-osx/2d7b235f9354174561257a75c468f753ed4441eea735fd7d701d2fafeca0478c/8.0.1/share/x86_64-osx-ghc-8.0.1/to-do-0.1.0.0"
libexecdir = "/Users/zarkodencic/Documents/Coding/cli-to-do/.stack-work/install/x86_64-osx/2d7b235f9354174561257a75c468f753ed4441eea735fd7d701d2fafeca0478c/8.0.1/libexec"
sysconfdir = "/Users/zarkodencic/Documents/Coding/cli-to-do/.stack-work/install/x86_64-osx/2d7b235f9354174561257a75c468f753ed4441eea735fd7d701d2fafeca0478c/8.0.1/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "to_do_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "to_do_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "to_do_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "to_do_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "to_do_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
