
Compile for Win32
=================

  * retry cross-compile with LATEST versions of lazarus + fpc
  * try win32 lazarus in wine




Shrink launcher file size
=========================

  * split core into a DLL or seperate app, let launcher load it from windir
    * easier global upgrade to latest script engine

  * seperate app: how to pass argv verbatim?
    * stdio? core could be CLI app
      * launcher hides its terminal
      * can still open a debug window in case of panic

  * seperate app: could even include an editor for launchers

