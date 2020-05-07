# vlc-bookmarks-editor
vlc extension to create and edit bookmarks.

## Overview

The default `Bookmark` of vlc cannot be stored permanently. If you close the media file, the bookmarks will disappear. So we need a bookmark management extension to store the bookmarks permanently.

**moment Track** is a popular bookmark editing extension, it works fine on Windows and Linux, but does not always work on mac. So I develops this extension `bookmark editor`. 

It also has some unique features.

**1. seperate media bookmarks file**

`bookmark editor` stores a bookmark file for each media file.  The boolmark file is  named after the media file name and the extension is`txt`. The default storage path is the user configuration data folder . 

-  `/User s/user_name/Library/Application\ Support/org.videolan.vlc` on Mac, 
- `%APPDATA%\vlc` on Windows, 
- `/home/user_name/.local/share/vlc` on Linux. 

change `user_name` to your user name.

**2. Change storage path**

you can change it to the path you want in the extension

**3. Two modes**

`bookmark editor` has two modes, horizontal and vertical mode. 

There are more functions in horizontal mode,  change the bookmark storage path, edit the bookmarks with the default text editor, etc. This mode is more conducive to editing.

vertical mode is the default mode,which is more streamlined. You can drag it to the edge of the screen to make it easier to capture bookmarks.

See Usage for specific usage.

## Interface

On Mac :
<div
>
<img src='https://user-images.githubusercontent.com/17938939/81250113-c086d000-9052-11ea-88bd-e9b3360ee21b.png' width=320 height=290/>
<img src='https://user-images.githubusercontent.com/17938939/81249948-6ede4580-9052-11ea-8b81-75c649df66d8.png' width=100 height=290 />
</div>
On windows:
<div>
<img src='https://user-images.githubusercontent.com/17938939/81249950-70a80900-9052-11ea-9019-b886a07cc5ce.png' width=320 height=290/>
<img src='https://user-images.githubusercontent.com/17938939/81249951-71409f80-9052-11ea-8e8a-a42a04fa0bd8.png'width=150 height=320/>
</div>
On Linux :
<div>
<img src='https://user-images.githubusercontent.com/17938939/81249956-7271cc80-9052-11ea-825f-0e3890e380bf.png' width=320 height=290/>
<img src='https://user-images.githubusercontent.com/17938939/81249959-730a6300-9052-11ea-9efe-6ffa38612a31.png'width=150 height=320/>
</div>

## Installation

Download the `bookmark_editor.lua` file and place it in the vlc extension folder. 


- Windows (all users): `program_files\VideoLAN\VLC\lua\extensions\`
- Windows (current user): `%APPDATA%\vlc\lua\extensions\`
- Linux (all users): `/usr/lib/vlc/lua/extensions/`
- Linux (current user): `~/.local/share/vlc/lua/extensions/`
- Mac OS X (all users):`/Applications/VLC.app/Contents/MacOS/share/lua/extensions/`
- Mac OS X (current user): `/Users/user_name/Library/Application\ Support/org.videolan.vlc/lua/extensions/`


Change program_files to the path of your vlc program
change  `user_name` to your username.


## Usage

**start extension**
- Start vlc and your video
- Click on the menu  `VLC > Extension > VLSub` on Mac OS X or code `View > VLSub`  on windows/linux. P

**horizontal mode features**
- Capture: pause media, pop up input box, enter bookmark title
- Storage: Play media and store bookmarks to drive
- Edit : edit the selected bookmark
- Remove : remove the selected bookmark
- Jump to: jump to the time of current bookmark
- Jump pre :Jump to the time of the previous bookmark
- Jump next : jump to the time of next bookmark
- Vertical : restart the extension to make the switch take effect
- Editor : Open the bookmark file with a text editor. TextEdit on Mac, Notepad on windows, gedit on Linux
- Reload :After playing another media, or editing the bookmark with a text editor, load the bookmark file from the hard disk
- Location :The default storage location of the bookmark file, you can edit it in the text input
- Go to : open the bookmarks folder with the folder management tool, which is finder on Mac, explorer on Windows, nautilus in the Linux.
- Update :Update the storage location to user preferences, restart the extension to take effect, or click the reload button in the extension


**vertical mode features**

- Same button as horizontal mode, same function
- horizontal : switch to horizontal mode.  restart expansion, take effect

## See also


