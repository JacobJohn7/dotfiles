-- AUTOSTART PROGRAMS
-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function () 
  -- 1. Plugin and Core Reloads
  hl.exec_cmd("hyprpm reload &")

  -- 2. Authentication Polkit Agent
  hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1 &")

  -- 3. Notification and Idle managers
  hl.exec_cmd("swaync &")
  hl.exec_cmd("hypridle &")

  -- 4. Clipboard History managers
  hl.exec_cmd("wl-paste --type text --watch cliphist store &")
  hl.exec_cmd("wl-paste --type image --watch cliphist store &")

  -- 5. Live Wallpaper (Sharp, hardware-accelerated nvdec, optimized video + auto-pause + IPC socket)
  hl.exec_cmd("mpvpaper -p -o \"--loop --no-audio --hwdec=auto --input-ipc-server=/tmp/mpv-wallpaper-socket\" \"*\" \"/home/mello/Pictures/Live Wallpaper/gothic-golden-crown-king-moewalls-com_optimized.mp4\" &")
  hl.exec_cmd("/home/mello/.config/hypr/Scripts/wallpaper_controller.py &")

  -- 6. Waybar (Provides System Tray DBus registration)
  hl.exec_cmd("waybar &")

  -- 7. Tray Applets (Sequenced 2 seconds after Waybar to ensure tray socket availability)
  hl.exec_cmd("sleep 2 && nm-applet --indicator &")
  hl.exec_cmd("sleep 2 && kdeconnect-indicator &")

  -- 8. SwayOSD (On Screen Display server)
  hl.exec_cmd("swayosd-server -s ~/.config/swayosd/style.css &")

  -- 9. Desktop Virtual Pet
  hl.exec_cmd("sleep 3 && python /home/mello/Projects/desktop-pet/main.py &")
end)

