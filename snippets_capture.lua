function descriptor()
  return {
    title = "bookmarks editor",
    version = "1.0",
    author = "devin",
    url = 'https://github.com/No-notion/bookmarks-captures',
    shortdesc = "create and edit bookmarks",
    description = "",
    capabilities = {"menu", "playing-listener"}
  }
end

dest = nil

item_name = nil

bookmarks =  {}
current_item = 1

mode = 0 -- 0 for normal mode ; 1 for edit mode

layout_config = '0'  -- 0 - vertical 1 - horizontal
user_datadir = nil

os_type = nil  -- windows, linux, mac


function activate()

  if  xpcall(get_media_info,errorHandle)  then
    dbg_print("Welcome")
    check_system()
    initData()
    initMainUI()
  else

    local err_dialog = vlc.dialog("warning")
    err_dialog:add_label("<div style='color:RoyalBlue;'>please open one media before running this extension</div>",1,1,1,1)

  end

end

function initData()
  get_media_info()

  load_preference()

  load_bookmarks()

end

function get_media_info()

  input = vlc.object.input()

  item_name = vlc.input.item():name()
  
end

function load_preference()

  user_datadir = vlc.config.userdatadir()
  pref_path = user_datadir .. '/' .. 'pref' .. ".txt"

  local open_file = can_open_file(pref_path)
  local prefers = {}
  if (open_file ) then
    for line in io.lines(pref_path) do
      prefers[#prefers + 1] = line
    end

    layout_config = prefers[1]
    user_datadir = prefers[2]
  else

    xpcall(write_file(pref_path,preference_string()),errorHandle)

  end

  dest = user_datadir .. '/' .. item_name .. '.txt'


end


function capture_bookmark()

  if (mode ==1) then
    return
  end

  mode = 1

  xpcall(vlc_player_pause(),errorHandle)

  current_item = #bookmarks + 1

  local format_string = current_time_string()
  local dec_string = '[[' .. format_string .. ']]'
  bookmarks[current_item] = dec_string

  change_mode_ui()


end

function save_bookmark()

  if (mode == 0) then
    return
  end
  mode = 0;

  xpcall(vlc_player_resume(),errorHandle)

  update_bookmarks_from_input()
  change_mode_ui()
  write_bookmarks_to_drive()

end

function edit_bookmark()

  if (mode == 1)then
    return
  end

  mode = 1

  xpcall(vlc_player_pause(),errorHandle)

  current_item = selection_item()
  change_mode_ui()

end

function remove_bookmark()

  if (mode == 1)then
    return
  end

  local selects = bookmarks_list:get_selection()
  for i,v in pairs(selects) do
    table.remove(bookmarks,i)
  end

  bookmarks_list:clear()
  show_bookmarks()
  write_bookmarks_to_drive()

end

function update_bookmarks_from_input()

  local text = text_input:get_text()

  if text then
    if (user_type_nothing(text)) then
      text = text .. 'Untitled'
    end
    bookmarks[current_item] = text
  end

end

function selection_item()

  local selections = bookmarks_list:get_selection()

  for i,v in pairs(selections) do
    return i ;
  end
  return -1 ;

end


function jump_prev()

  current_item = current_item - 1;

  if current_item < 1 then
    current_item = #bookmarks
  end

  jump_to_item(current_item)

end

function jump_to()

  local item = selection_item()
  if (item ~= -1) then
    current_item = item
    jump_to_item(current_item)
  end

end

function jump_next()

  current_item = current_item + 1

  if current_item > #bookmarks then
    current_item = 1
  end

  jump_to_item(current_item)

end

function jump_to_item(item)

  local line = bookmarks[current_item]
  local format_string = string.gmatch(line, "(%d+:%d+:%d+)")
  for time in format_string do
    stamp = stamp_from_time(time)
    xpcall(jump_to_stamp(stamp),errorHandle)
  end
end

function jump_to_stamp(stamp)

  if stamp then
    vlc.var.set(input,"time",stamp)
    vlc.playlist.play()
  end

end

function edit_with_editor()

  local command_str = nil

  if (os_type == 'windows') then
    command_str = string.format('start Notepad "%s"',dest)
  elseif(os_type == 'mac') then
    command_str = string.format('open "%s"',dest)
  else
    command_str = string.format('gedit "%s"',dest)
  end

  command_exe(command_str)

end

function reload_data()
  initData()
  bookmarks_list:clear()
  show_bookmarks()
end

function update_preference()

  user_datadir = location_label:get_text()

  xpcall(write_file(pref_path, preference_string()),errorHandle)
end


function goto_userdir()

  local location = current_location()
  local open_cmd = 'open '
  if (os_type == 'windows') then
    open_cmd = 'start explorer'
  elseif(os_type == 'linux') then
    open_cmd = 'nautilus '
  end

  local open_dir_command = string.format('%s "%s"',open_cmd, location)
  command_exe(open_dir_command)

end

function load_bookmarks()

  bookmarks = {}

  local can_open = can_open_file(dest)
  if (can_open == true) then
    for line in io.lines(dest) do
      bookmarks[#bookmarks+1] = line
    end
  end

end

function show_bookmarks()

  if (bookmarks_list)  then

    if (#bookmarks > 0) then

      for row =1,#bookmarks do

        local line = bookmarks[row]

        if (layout_config == '0') then
          bookmarks_list:add_value(string.sub(line, 13), row)
        else
          bookmarks_list:add_value(line, row)
        end

      end

    end
  end

end

function change_mode_ui()

  if (mode == 1) then

    local frame  = frame_with_layout(layout_config)
    local x,y,w,h = frame['edit_text'][1],frame['edit_text'][2],frame['edit_text'][3],frame['edit_text'][4]
    local dec_string = bookmarks[current_item]
    text_input = mainUI:add_text_input(dec_string,x,y,w,z)

  else

    if text_input  then
      mainUI:del_widget(text_input)
    end

    refresh_bookmarks_ui()

  end

end

function change_layout_ui()

  local text = layout_btn:get_text()

  if (text == 'Horizontal') then
    layout_config = '1'
  else
    layout_config = '0'
  end

  xpcall(write_file(pref_path,preference_string()),errorHandle)

end

function refresh_bookmarks_ui()

  if bookmarks_list   then
    bookmarks_list:clear()
    show_bookmarks()
  end

end

function initMainUI()

  local layout = frame_with_layout(layout)

  mainUI = vlc.dialog('bookmarks capture')
  local x,y,w,h = layout['top_lay'][1],layout['top_lay'][2],layout['top_lay'][3],layout['top_lay'][4]
  mainUI:add_label('</br>',x,y,w,z)

  x,y,w,h = layout['bookmarks'][1],layout['bookmarks'][2],layout['bookmarks'][3],layout['bookmarks'][4]
  bookmarks_list = mainUI:add_list(x,y,w,h)

  if (os_type == 'mac') then
    x,y,w,h = layout['edit_text'][1],layout['edit_text'][2],layout['edit_text'][3],layout['edit_text'][4]
    edit_text = mainUI:add_label('</br>', x,y,w,h)
  end
  x,y,w,h = layout['edit_label'][1],layout['edit_label'][2],layout['edit_label'][3],layout['edit_label'][4]
  edit_label_2 = mainUI:add_label('<b style="color:RoyalBlue;">Edit : </b>', x,y,w,h)

  x,y,w,h = layout['capture'][1],layout['capture'][2],layout['capture'][3],layout['capture'][4]
  capture_btn = mainUI:add_button('Caputre',capture_bookmark,x,y,w,h)

  x,y,w,h = layout['save'][1],layout['save'][2],layout['save'][3],layout['save'][4]
  save_btn = mainUI:add_button('Save',save_bookmark,x,y,w,h)

  x,y,w,h = layout['edit'][1],layout['edit'][2],layout['edit'][3],layout['edit'][4]
  edit_btn = mainUI:add_button('Edit',edit_bookmark,x,y,w,h)

  x,y,w,h = layout['remove'][1],layout['remove'][2],layout['remove'][3],layout['remove'][4]
  remove_btn = mainUI:add_button('Remove',remove_bookmark,x,y,w,h)

  x,y,w,h = layout['jump_label'][1],layout['jump_label'][2],layout['jump_label'][3],layout['jump_label'][4]

  jump_label = mainUI:add_label('<b style="color:RoyalBlue;">Jump : </b>', x,y,w,h)

  x,y,w,h = layout['jump'][1],layout['jump'][2],layout['jump'][3],layout['jump'][4]
  jump_btn = mainUI:add_button('Jump To',jump_to,x,y,w,h)

  x,y,w,h = layout['jump_pre'][1],layout['jump_pre'][2],layout['jump_pre'][3],layout['jump_pre'][4]
  jump_pre = mainUI:add_button('Jump prev',jump_prev,x,y,w,h)

  x,y,w,h = layout['jump_next'][1],layout['jump_next'][2],layout['jump_next'][3],layout['jump_next'][4]
  jump_next = mainUI:add_button('Jump next',jump_next,x,y,w,h)

  x,y,w,h = layout['prefer_label'][1],layout['prefer_label'][2],layout['prefer_label'][3],layout['prefer_label'][4]
  prefer_label = mainUI:add_label('<b style="color:RoyalBlue;">Preference : </b>', x,y,w,h)

  x,y,w,h = layout['layout_config'][1],layout['layout_config'][2],layout['layout_config'][3],layout['layout_config'][4]
  local text = nil

  if (layout_config == '1') then
    text = 'Vertical'
  else
    text = 'Horizontal'
  end

  layout_btn = mainUI:add_button(text,change_layout_ui,x,y,w,h)

  if (layout_config == '1') then

    x,y,w,h = layout['location_label'][1],layout['location_label'][2],layout['location_label'][3],layout['location_label'][4]
    mainUI:add_label('<b style="color:RoyalBlue;">Location : </b>', x,y,w,h)

    x,y,w,h = layout['location_text'][1],layout['location_text'][2],layout['location_text'][3],layout['location_text'][4]
    location_label = mainUI:add_text_input(user_datadir, x,y,w,h)

    x,y,w,h = layout['edit_with_editor'][1],layout['edit_with_editor'][2],layout['edit_with_editor'][3],layout['edit_with_editor'][4]
    mainUI:add_button('Editor',edit_with_editor, x,y,w,h)

    x,y,w,h = layout['reload'][1],layout['reload'][2],layout['reload'][3],layout['reload'][4]
    mainUI:add_button('Reload',reload_data, x,y,w,h)

    x,y,w,h = layout['update'][1],layout['update'][2],layout['update'][3],layout['update'][4]
    mainUI:add_button('Update',update_preference, x,y,w,h)

    x,y,w,h = layout['go_to'][1],layout['go_to'][2],layout['go_to'][3],layout['go_to'][4]
    mainUI:add_button('Go to',goto_userdir, x,y,w,h)

  end

  show_bookmarks()


end

function frame_with_layout(lay)

  if(layout_config == '0' ) then

    local y = 4
    if (os_type == 'mac') then
      y = 3
    end

    local frame = {
      top_lay = {1,1,1,0},
      bookmarks = {1,2,1,3},
      edit_text = {1,y,1,1},
      edit_label = {1,y+1,1,1},
      capture = {1,y+2,1,1},
      save = {1,y+3,1,1},
      edit = {1,y+4,1,1},
      remove = {1,y+5,1,1},
      jump_label = {1,y+6,1,1},
      jump = {1,y+7,1,1},
      jump_next = {1,y+9,1,1},
      jump_pre = {1,y+8,1,1},
      prefer_label = {1,y+10,1,1},
      layout_config = {1,y+11,1,1}
    }
    return frame

  else
    local y = 6
    if (os_type == 'mac') then
      y = 5
    end

    local frame = {
      top_lay = {1,1,6,1},
      bookmarks = {1,2,5,3},
      edit_text = {1,y-2,5,1},
      edit_label = {1,y-1,1,1},
      capture = {2,y-1,1,1},
      save = {3,y-1,1,1},
      edit = {4,y-1,1,1},
      remove = {5,y-1,1,1},
      jump_label = {1,y,1,1},
      jump = {2,y,1,1},
      jump_text = {3,y,1,1},
      jump_next = {5,y,1,1},
      jump_pre = {4,y,1,1},
      prefer_label = {1,y+1,1,1},
      layout_config = {2,y+1,1,1},
      location_label = {1,y+2,1,1},
      location_text = {2,y+2,2,1},
      update = {5,y+2,1,1},
      go_to = {4,y+2,1,1},
      reload = {4,y+1,1,1},
      edit_with_editor = {3,y+1,1,1},
      message = {3,y+2,1,1},
      message_text = {4,y+2,2,1}
    }
    return frame

  end

end

function current_location()

  return location_label:get_text()

end

function write_bookmarks_to_drive()

  local contents = ""

  if (#bookmarks > 0) then
    for i,v in ipairs(bookmarks) do
      contents = contents .. v .. '\n'
    end

    if(contents ~= "") then
      xpcall(write_file(dest,contents),errorHandle)
    end

  end

end

function can_open_file(name)

  local file = io.open(name,'r')

  local exist = false

  if (file ) then
    exist = true
    file:close()
  end

  return exist
end

function write_file(name,contents)

  local file = io.open(name,'w')
  if (file) then
    file:write(contents)
    file:close()
  end

end


function user_type_nothing(text)

  local type_nothing = false
  if (#text < 13) then
    type_nothing = true
  end

  return type_nothing
end

function preference_string()

  return layout_config .. '\n' .. user_datadir .. '\n'

end

function current_time_string()
  local stamp = vlc.var.get(input,"time")
  local format_string = time_from_stamp(stamp)
  return format_string
end

function time_from_stamp(stamp)
  stamp = math.floor(stamp/1000000)
  local hours = stamp/(60*60)
  stamp= stamp%(60*60)
  local minutes =stamp/60
  local seconds =stamp%60
  return string.format("%02d:%02d:%02d",hours,minutes,seconds)
end

-- with the format dd:dd:dd
function stamp_from_time(time)

  local hours =  string.sub(time, 0,2)
  local minutes = string.sub(time, 4,5)
  local seconds = string.sub(time, 7,8)

  return (hours*60*60+minutes*60+seconds)*1000000

end

function vlc_player_pause()

  if vlc.playlist.status() ~= "paused" then
    vlc.playlist.pause()
  end

end

function vlc_player_resume()

  if vlc.playlist.status() == "paused" then
    vlc.playlist.play()
  end

end

function dbg_print(content)
  if type(content) == 'string' then
    vlc.msg.dbg('[bookmarks Capture --]' .. content)
  else
    vlc.msg.dbg('[bookmarks Capture --]' .. 'can not print un-string')
  end
end

function err_print(content)
  if type(content) == 'string' then
    vlc.msg.error('[bookmarks Capture Error --]' .. content)
  else
    vlc.msg.error('[bookmarks Capture --]' .. 'can not print un-string')
  end
end

function errorHandle(error)
  err_print(error)
end

function command_exe(command)

  dbg_print('will execute command : ' .. command)
  ret = os.execute(command)
  dbg_print('command results : \n' .. ret)

end

function close()
  vlc.deactivate()
end

function deactivate()
  dbg_print('bye bye')
  if mainUI  then
    mainUI:hide()
  end
end

function check_system()
  os_type = 'windows'
  local user_dir = vlc.config.userdatadir()

  local contains_linux_path = string.find(user_dir, '.local/share/vlc')
  local contains_mac_path = string.find(user_dir, 'Library/Application')
  if(contains_linux_path) then
    os_type = 'linux'

  elseif (contains_mac_path) then
    os_type = 'mac'
  end
end

