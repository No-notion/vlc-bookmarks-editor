# vlc-bookmarks-editor
vlc extension to create and edit bookmarks.

## overview

There are three  reasons for this extension. One is that the Bookmarks that come with vlc cannot store bookmarks permanently. After the media file is closed, the bookmarks disappear.

Another point is that because of the same type of extension, it often does not work on Mac. `bookmark editor` is developed on Mac and compatible with it. Also tested on windows and linux.

`bookmark editor` saves a bookmark file for each media file, named after the media name, with the extension `.txt`. The default storage path is the vlc user config path. `/Users/user_name/Library/Application\ Support/org.videolan.vlc` in Mac, `C:\Users\user_name\AppData\Roaming\vlc` in Windows, `/home/user_name/.local/share/vlc` in Linux. You can also go to this path in the editor.

you can modify and update this path in the editor, wherever you like.

`bookmark editor` has two modes, landscape and portrait mode. they look like the picture below
On Mac :

<img src='./img/ss_01.png' width=320 height=290/>
<img src='./img/ss_02.png' width=100 height=290/>

On windows:

<img src='./img/ss_03.png' width=320 height=290/>
<img src='./img/ss_04.png'width=150 height=320/>

On Linux :

<img src='./img/ss_05.png' width=320 height=290/>
<img src='./img/ss_06.png'width=150 height=320/>


There are more functions in landscape mode, you can use Editor to edit, change the storage path, etc. It is also more conducive to editing.

Portrait mode is the default mode, it is more streamlined. And it can be dragged to the side of the screen, which is more conducive to capturing bookmarks.

See Usage for specific usage.

## Installation



Download the lua source file, and put it in the vlc extensions directory.

you can find the instructions how to create/find the extensions direcotry from https://github.com/exebetche/vlsub

## Usage

**start extension**
- Start vlc and your video
- Click on the menu View > VLSub  on windows/linux or VLC > Extension > VLSub on Mac OS X

**horizontal mode features**
- Capture : pause the video, and popup text field to enter the title for the snippet
- Save : resume the video , and save the snippet to drive
- Edit : edit the selection snippet
- Remove : remove the selection snippet
- Jump to: jump to the time of current snippet
- Jump pre : jump to the time of previous snippet
- Jump next : jump to the time of next snippet
- Vertical : Enter vertical mode. then restart extension to make the change work.
- Editor : edit current media snippets file with TextEdit on Mac, Notepad on windows, gedit on Linux.
- Reload : load the media snippets from drive, After you edit the snippets file with Editor, or play another media.
- Location : the default location snippets file located, you can edit in the text field.
- Go to : open the snippets directory with Finder on Mac, explorer on Mac, nautilus in the Linux.
- Update : set the changed location to preference, tap reload button will make update work instantly.

**vertical mode features**
- horizontal : Enter horizontal mode. then restart extension to make the change work.

## See also
