# vlc-bookmarks-editor
vlc extension to create and edit bookmarks.
这句不用翻译
## overview
总览

The default `Bookmark` of vlc cannot store bookmarks permanently. After closing the media, the bookmarks gone. So we need a bookmark editor to store the bookmarks permanently.
vlc默认的书签不能永久存储，关闭了媒体文件，书签也就消失了。所以我们需要安装个书签管理扩展来永久存储书签

**moment Track** is a very popular bookmark extensions. It works well on windows and linux, but it usually doesn't work on mac. So I developed this extension `bookmark editor`

momentTracker 是个流行的书签编辑扩展, 它在windowss和mac上运行正常，在mac上却并不总是工作。所以我觉得开发这款扩展


It also has unique features.
他也有自己独特的特性

**1. seperate media bookmarks file**
单独的书签文件

`bookmark editor` stores a separate file for each media bookmarks.  the file is  named after the media name, with the extension `.txt`. The default storage path is the vlc user config path.  they are 
书签编辑器为每个媒体文件存储一个书签文件，书签文件以媒体文件名命名，扩展名为txt。 默认的存储路径为用户配置数据文件夹


-  `/User s/user_name/Library/Application\ Support/org.videolan.vlc` on Mac, 
- `%APPDATA%\vlc` on Windows, 
- `/home/user_name/.local/share/vlc` in Linux. 
不用翻译


change the `user_name` to your user name.
将 user_name 改成你设备的用户名

**2. change directory**
更改存储路径

you can modify and update storage path in the extension, wherever you like.
你可以在扩展中修改成你想要的路径

**3. double modes**
两种模式

`bookmark editor` has two modes, horizontal and vertical mode. they look like the picture below
书签编辑器有两种模式，horizontal 和 vertical mode , 他们看上去像这样

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
 不用翻译

There are more functions in horizontal mode, you can use Editor to edit, change the storage path, etc. It is also more conducive to editing.
horizontal 模式有所有的功能，改变书签存储路径，用默认的文本编辑器编辑书签等。这种模式更利于编辑

vertical mode is the default mode, it is more streamlined. It can be dragged to the side of the screen, which is more conducive to capturing bookmarks.
Portait mode 是默认的模式，它更精简。你可以将它拖动到屏幕边缘，这样捕捉书签更方便。

See Usage for specific usage.
具体使用参见Usage

## Installation
不用翻译

Download the `bookmark_editor.lua` file and place the file in the vlc extension path. 
下载 lua 文件， 将它放在vlc 扩展文件夹


- Windows (all users): `program_files\VideoLAN\VLC\lua\extensions\`
- Windows (current user): `%APPDATA%\vlc\lua\extensions\`
- Linux (all users): `/usr/lib/vlc/lua/extensions/`
- Linux (current user): `~/.local/share/vlc/lua/extensions/`
- Mac OS X (all users):`/Applications/VLC.app/Contents/MacOS/share/lua/extensions/`
- Mac OS X (current user): `/Users/user_name/Library/Application\ Support/org.videolan.vlc/lua/extensions/`
不用翻译


change the `program_files` to location where your vlc app located.
change the `user_name` to your user name.
将 program_files 改为你 vlc 程序的路径的路径
将user_name 改为 你的 用户名


## Usage
使用方法

**start extension**
- Start vlc and your video
- Click on the menu  `VLC > Extension > VLSub` on Mac OS X or code `View > VLSub`  on windows/linux. Please note that the extension entry on Mac, because some tutorials write that it is in the view, which only works on windows or linux.
这两句不用翻译，因为我抄的官网

**horizontal mode features**
- Capture : pause the media, and text field appears to enter the title for the bookmark
捕捉 ： 暂停media, 弹出输入框，输入书签标题

- Save : resume the video , and save the bookmark to drive
存储： 播放mediam 存储书签到硬盘

- Edit : edit the selection bookmark
编辑 ： 编辑选中书签

- Remove : remove the selection bookmark
删除 ： 删除选中书签

- Jump to: jump to the time of current bookmark
Jump to : 跳转到当前书签时间

- Jump pre : jump to the time of previous bookmark
Jump pre ： 跳转到上一个书签的时间

- Jump next : jump to the time of next bookmark
Jump Next ： 跳转到下一个书签的时间

- Vertical : switch to vertical mode. to make the change work, reactivate the extension
Vertical : 切换到vertical mode, 重启扩展，使切换生效

- Editor : edit current media bookmarks file with TextEdit on Mac, Notepad on Windows, gedit on Linux.
Editor : 用文本编辑器打开书签文件，在Mac上是TextEdit, 在windows上是 Notepad, 在Linux上是gedit

- Reload : load the media bookmarks from drive, after you edited the bookmarks file with Editor, or played another media.
重载 ： 在播放另一个media, 或者用文本编辑器编辑书签后，从硬盘中加载书签文件

- Location : the default location of bookmarks file, you can edit within the extension.
位置 ： 书签文件的默认存储位置， 你可以在编辑框中编辑

- Go to : open the bookmarks directory with Finder on Mac, explorer on Windows, nautilus in the Linux.
goto : 用文件夹管理工具打开书签文件夹，在mac上是finder, 在windows上是explorer, 在Linux是nautilus 


- Update : Store the location in user preference, effective after reactivate the extension, or click the reload button within the extension to make change instantly.
Update : 更新存储位置到用户偏好设置， 重启扩展生效，或者点击扩展中的reload按钮

**vertical mode features**
不用翻译

- all the same features are consistent with horizontal mode
和horizontal模式下同样的按钮，具有同样的功能

- horizontal : switch to horizontal mode. to make the change work, reactivate the extension
horizontal : 切换到horizontal mode , 重启扩展， 生效

## See also
<!-- 


# vlc-bookmarks-editor
vlc extension to create and edit bookmarks.

## overview

The default `Bookmark` of vlc cannot store bookmarks permanently. After closing the media, the bookmarks gone. So we need a bookmark editor to store the bookmarks permanently.

**moment Track** is a very popular bookmark editor. It works well on windows and linux, but it usually doesn't work on mac. So I developed this extension `bookmark editor`

It also has unique features.

**1. seperate media bookmarks file**

`bookmark editor` stores a separate file for each media bookmarks.  the file is  named after the media name, with the extension `.txt`. The default storage path is the vlc user config path.  they are 
-  `/User s/user_name/Library/Application\ Support/org.videolan.vlc` on Mac, 
- `%APPDATA%\vlc` on Windows, 
- `/home/user_name/.local/share/vlc` in Linux. 

change the `user_name` to your user name.

**2. change directory**

you can modify and update storage path in the editor, wherever you like.

**3. double modes**

`bookmark editor` has two modes, horizontal and vertical mode. they look like the picture below

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

There are more functions in horizontal mode, you can use Editor to edit, change the storage path, etc. It is also more conducive to editing.

vertical mode is the default mode, it is more streamlined. It can be dragged to the side of the screen, which is more conducive to capturing bookmarks.

See Usage for specific usage.

## Installation

Download the `bookmark_editor.lua` file and place the file in the vlc extension path. 

- Windows (all users): `program_files\VideoLAN\VLC\lua\extensions\`
- Windows (current user): `%APPDATA%\vlc\lua\extensions\`
- Linux (all users): `/usr/lib/vlc/lua/extensions/`
- Linux (current user): `~/.local/share/vlc/lua/extensions/`
- Mac OS X (all users):`/Applications/VLC.app/Contents/MacOS/share/lua/extensions/`
- Mac OS X (current user): `/Users/user_name/Library/Application\ Support/org.videolan.vlc/lua/extensions/`

change the `program_files` to location where your vlc app located.
change the `user_name` to your user name.


## Usage

**start extension**
- Start vlc and your video
- Click on the menu  `VLC > Extension > VLSub` on Mac OS X or code `View > VLSub`  on windows/linux. Please note that the extension entry on Mac, because some tutorials write that it is in the view, which only works on windows or linux.

**horizontal mode features**
- Capture : pause the video, and text field appears to enter the title for the bookmark
- Save : resume the video , and save the bookmark to drive
- Edit : edit the selection bookmark
- Remove : remove the selection bookmark
- Jump to: jump to the time of current bookmark
- Jump pre : jump to the time of previous bookmark
- Jump next : jump to the time of next bookmark
- Vertical : switch to vertical mode. to make the change work, reactivate the extension
- Editor : edit current media bookmarks file with TextEdit on Mac, Notepad on Windows, gedit on Linux.
- Reload : load the media bookmarks from drive, after you edited the bookmarks file with Editor, or played another media.
- Location : the default location of bookmarks file, you can edit within the extension.
- Go to : open the bookmarks directory with Finder on Mac, explorer on Mac, nautilus in the Linux.
- Update : Store the location in user preference, effective after reactivate the extension, or click the reload button within the extension to make change instantly.

**vertical mode features**
- all the same features are consistent with horizontal mode
- horizontal : switch to horizontal mode. to make the change work, reactivate the extension

## See also -->
