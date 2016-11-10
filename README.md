
WinJmpSt
========

An application jump-start facility for Windows,
aimed to replace shortcut files (`.lnk`).



Motivation
----------

Back in WinXP days, I could make launchers for most of my scripts by just
creating a shortcut file (`*.lnk`) that points to an interpreter, with my
script's path as an argument.
One drawback was that when I tried to drag-and-drop a data file onto the
shortcut, it would pass that data file's path as an argument, but as an
argument to the interpreter program, instead of to my script.

Last year (2015) I encountered the first incident of some more modern Windows
refusing to add my shortcut (to a command file `*.cmd`) to some of its panels.
When trying to add another shortcut that opened a folder in explorer,
it added a button that would start explorer, but not with that folder,
and I also couldn't find a way to change the icon.

Shortcut files may be on the decline, but EXEs probably won't any time soon,
so I try to create an EXE-y replacement for them: WinJmpSt.



Proposed Solution
-----------------

Inspired by self-extracting ZIP files, the goal for WinJmpSt is to have a
minimal, static file header that makes the file executable, and on execution,
works on the data part of that same EXE file.
The data part in this case is a config file that describes the desired
startup actions as plain text, encoded as either UTF-8 or ANSI.

For the icon I'll have to adhere to traditional storage formats, so I'll try
and provide patcher programs that help replace it.














License
-------
ISC
