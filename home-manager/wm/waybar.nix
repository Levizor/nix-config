{pkgs, ...}:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        output = "eDP-1";
        layer = "top";
        position = "left";
        width = 28;
        margin = "2 0 2 2";
        spacing = 2;
        modules-left = [
          "clock"
          "custom/sep"
          "tray"
        ];
        modules-center = [
          "hyprland/workspaces"
        ];
        modules-right = [
          # "custom/bluetooth_devices",
          "custom/sep"
          "temperature"
          "custom/sep"
          "pulseaudio"
          "custom/powermenu"
        ];
        "custom/sep" = {
          "format" = " ";
        };
        "custom/powermenu" = {
          "on-click"= "~/.config/wofi/scripts/wofipowermenu.py";
          "format" = "";
          "tooltip" = false;
        };
        "custom/bluetooth_devices" = {
          "exec" = "$HOME/.config/waybar/custom_modules/bluetooth_devices.sh";
          "return-type" = "json";
          "format" = "{}";
          "justify" = "center";
          "rotate" = 90;
          "interval" = 5;
          "on-click" = "blueman-manager";
        };
        "hyprland/workspaces" = {
          "format" = "{icon}";
          "on-click" = "activate";
          "on-scroll-up" = "hyprctl dispatch workspace e-1";
          "on-scroll-down" = "hyprctl dispatch workspace e+1";
          "format-icons" = {
            "active" = "";
            "urgent" = "";
            "default" = "";
          };
        };
        "clock" = {
          "tooltip" = true;
          "format" = "{:%H\n%M}";
          "tooltip-format" = "{:%Y-%m-%d}";
        };
        "tray" = {
          "icon-size" = 18;
          "show-passive-items" = "true";
        };
        "temperature" = {
          "rotate" = 90;
          "hwmon-path" = "/sys/class/hwmon/hwmon3/temp1_input";
          "critical-threshold" = 80;
          "format" = "{icon} {temperatureC}°C";
          "format-icons" = [
            ""
            ""
            ""
          ];
        };
        "pulseaudio" = {
          "rotate" = 90;
          "format" = "{icon} {volume}%";
          "format-bluetooth" = "{icon} {volume}%";
          "format-muted" = "MUTE ";
          "format-icons" = {
            "headphones" = "";
            "handsfree" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = [
              ""
              ""
            ];
          };
          "scroll-step" = 3;
          "on-click" = "pavucontrol";
          "on-click-right" = "pactl set-source-mute @DEFAULT_SOURCE@ toggle";
        };
                # "custom/hello-from-waybar" = {
      #   format = "hello {}";
      #   max-length = 40;
      #   interval = "once";
      #   exec = pkgs.writeShellScript "hello-from-waybar" ''
      #     echo "from within waybar"
      #   '';
      # };

      };    

      second = {
        output = "HDMI-A-1";
        layer = "top";
        position = "right";
        width = 28;
        margin = "2 0 2 2";
        spacing = 2;
        modules-left = [
          "clock"
          "custom/sep"
          "tray"
        ];
        modules-center = [
          "hyprland/workspaces"
        ];
        modules-right = [
          # "custom/bluetooth_devices",
          "custom/sep"
          "temperature"
          "custom/sep"
          "pulseaudio"
          "custom/powermenu"
        ];
        "custom/sep" = {
          "format" = " ";
        };
        "custom/powermenu" = {
          "on-click"= "~/.config/wofi/scripts/wofipowermenu.py";
          "format" = "";
          "tooltip" = false;
        };
        "custom/bluetooth_devices" = {
          "exec" = "$HOME/.config/waybar/custom_modules/bluetooth_devices.sh";
          "return-type" = "json";
          "format" = "{}";
          "justify" = "center";
          "rotate" = 90;
          "interval" = 5;
          "on-click" = "blueman-manager";
        };
        "hyprland/workspaces" = {
          "format" = "{icon}";
          "on-click" = "activate";
          "on-scroll-up" = "hyprctl dispatch workspace e-1";
          "on-scroll-down" = "hyprctl dispatch workspace e+1";
          "format-icons" = {
            "active" = "";
            "urgent" = "";
            "default" = "";
          };
        };
        "clock" = {
          "tooltip" = true;
          "format" = "{:%H\n%M}";
          "tooltip-format" = "{:%Y-%m-%d}";
        };
        "tray" = {
          "icon-size" = 18;
          "show-passive-items" = "true";
        };
        "temperature" = {
          "rotate" = 90;
          "hwmon-path" = "/sys/class/hwmon/hwmon3/temp1_input";
          "critical-threshold" = 80;
          "format" = "{icon} {temperatureC}°C";
          "format-icons" = [
            ""
            ""
            ""
          ];
        };
        "pulseaudio" = {
          "rotate" = 90;
          "format" = "{icon} {volume}%";
          "format-bluetooth" = "{icon} {volume}%";
          "format-muted" = "MUTE ";
          "format-icons" = {
            "headphones" = "";
            "handsfree" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = [
              ""
              ""
            ];
          };
          "scroll-step" = 3;
          "on-click" = "pavucontrol";
          "on-click-right" = "pactl set-source-mute @DEFAULT_SOURCE@ toggle";
        };
                # "custom/hello-from-waybar" = {
      #   format = "hello {}";
      #   max-length = 40;
      #   interval = "once";
      #   exec = pkgs.writeShellScript "hello-from-waybar" ''
      #     echo "from within waybar"
      #   '';
      # };

      };    
    };
  };
}
