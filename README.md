# vlc-bookmarks-editor
An extension for VLC that enables the creation and editing of bookmarks.

## Introduction

The VLC's default Bookmark feature doesn't offer permanent storage. When you close the media file, the bookmarks disappear. To address this, we introduce the bookmark editor extension that allows for permanent bookmark storage.
While moment Track is a widely used bookmark editing extension that works well on Windows and Linux, it's inconsistent on Mac. Hence, the development of bookmark editor which also offers unique functionalities.

## Features
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

**Launching the Extension**
- Begin by starting VLC and your chosen video.
- Navigate to VLC > Extension > Bookmarks Editor on Mac OS X or View > Bookmarks Editor on Windows/Linux to open the extension.
**Features in Horizontal Mode**
 - Capture: Pause the media, a pop-up input box will appear for you to enter the bookmark title.
 - Storage: Play the media and store bookmarks to your drive.
 - Edit: Modify the selected bookmark.
 - Remove: Delete the selected bookmark.
 - Jump to: Navigate to the timestamp of the current bookmark.
 - Jump pre: Navigate to the timestamp of the previous bookmark.
 - Jump next: Navigate to the timestamp of the next bookmark.
 - Vertical: Restart the extension to switch to vertical mode.
 - Editor: Open the bookmark file with a text editor, such as TextEdit on Mac, Notepad on Windows, or Gedit on Linux.
 - Reload: After switching to another media or editing the bookmark with a text editor, this will load the bookmark file from the hard drive.
 - Location: This is the default storage location of the bookmark file, which can be modified in the text input field.
 - Go to: Open the bookmarks folder with the folder management tool. This is Finder on Mac, Explorer on Windows, and Nautilus on Linux.
 - Update: Update the storage location to user preferences. Restart the extension for the changes to take effect, or click the reload button in the extension.


**Features in Vertical Mode**

 - The buttons function the same as in horizontal mode.
 - Horizontal: Switch to horizontal mode. Restart the extension for the changes to take effect.

## See also


