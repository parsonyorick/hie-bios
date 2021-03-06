module HIE.Bios.Flags (getCompilerOptions, getCompilerOptionsWithLogger, LoggingFunction) where

import HIE.Bios.Types
import HIE.Bios.Internal.Log


-- | Initialize the 'DynFlags' relating to the compilation of a single
-- file or GHC session according to the provided 'Cradle'.
getCompilerOptions ::
    FilePath -- The file we are loading it because of
    -> Cradle a
    -> IO (CradleLoadResult ComponentOptions)
getCompilerOptions =
  getCompilerOptionsWithLogger logm

getCompilerOptionsWithLogger ::
  LoggingFunction
  -> FilePath
  -> Cradle a
  -> IO (CradleLoadResult ComponentOptions)
getCompilerOptionsWithLogger l fp cradle =
  runCradle (cradleOptsProg cradle) l fp


----------------------------------------------------------------
