#!/usr/bin/env python3
import socket
import json
import subprocess
import time
import os

IPC_SOCKET = "/tmp/mpv-wallpaper-socket"

def send_mpv_command(command):
    if not os.path.exists(IPC_SOCKET):
        return False
    try:
        with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as s:
            s.settimeout(0.5)
            s.connect(IPC_SOCKET)
            payload = json.dumps({"command": command}) + "\n"
            s.sendall(payload.encode('utf-8'))
            response = s.recv(1024)
            return True
    except Exception as e:
        # Silently fail if mpvpaper is not running yet
        return False

def get_hyprland_state():
    try:
        monitors_out = subprocess.check_output(["hyprctl", "monitors", "-j"])
        clients_out = subprocess.check_output(["hyprctl", "clients", "-j"])
        
        monitors = json.loads(monitors_out.decode('utf-8'))
        clients = json.loads(clients_out.decode('utf-8'))
        
        active_workspaces = {m["activeWorkspace"]["id"] for m in monitors}
        
        # Check if there is any visible window on any of the active workspaces
        active_windows = 0
        for client in clients:
            if (client.get("mapped") == True and 
                client.get("hidden") == False and 
                client.get("workspace", {}).get("id") in active_workspaces):
                active_windows += 1
                
        return active_windows > 0
    except Exception as e:
        return False

def main():
    last_state = None # True for paused, False for playing
    
    while True:
        try:
            should_pause = get_hyprland_state()
            if should_pause != last_state:
                if should_pause:
                    success = send_mpv_command(["set_property", "pause", True])
                else:
                    success = send_mpv_command(["set_property", "pause", False])
                
                if success:
                    last_state = should_pause
            
        except Exception as e:
            pass
            
        time.sleep(0.5)

if __name__ == "__main__":
    main()
