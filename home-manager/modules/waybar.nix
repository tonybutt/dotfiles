{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin = "9 13 -10 18";

        modules-left = ["hyprland/workspaces" "hyprland/language" "keyboard-state" "hyprland/submap"];
        modules-center = ["clock" "custom/weather"];
        modules-right = ["pulseaudio" "custom/mem" "cpu" "backlight" "battery" "tray"];

        "hyprland/workspaces" = {
          disable-scroll = true;
        };

    "hyprland/language" = {
        format-en = "US";
	min-length = 5;
	tooltip = false;
    };

    "keyboard-state" = {
        numlock = true;
        capslock = true;
        format = "{icon} ";
        format-icons = {
            locked = " ";
            unlocked = "";
        };
    };

    "clock" = {
        timezone = "America/New_York";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format = "{:%a; %d %b, %I:%M %p}";
    };

    "custom/weather" = {
        format = "{}";
        tooltip = true;
        interval = 1800;
        exec = "$HOME/.config/waybar/scripts/wttr.py";
        return-type = "json";
    };

    "pulseaudio" = {
        # scroll-step = 1; # %, can be a float
        reverse-scrolling = 1;
        format = "{volume}% {icon} {format_source}";
        format-bluetooth = "{volume}% {icon} {format_source}";
        format-bluetooth-muted = " {icon} {format_source}";
        format-muted = " {format_source}";
        format-source = "{volume}% ";
        format-source-muted = "";
        format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
        };
        on-click = "pavucontrol";
        min-length = 13;
    };

    "custom/mem" = {
        format = "{} ";
        interval = 3;
        exec = "free -h | awk '/Mem:/{printf $3}'";
        tooltip = false;
    };

    "cpu" = {
      interval = 2;
      format = "{usage}% ";
      min-length = 6;
    };

    "temperature" = {
        # thermal-zone = 2;
        # hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
        critical-threshold = 80;
        # format-critical = "{temperatureC}°C {icon}";
        format = "{temperatureC}°C {icon}";
        format-icons = ["" "" "" "" ""];
        tooltip = false;
    };

    "backlight" = {
        device = "intel_backlight";
        format = "{percent}% {icon}";
        format-icons = [""];
        min-length = 7;
    };

    battery = {
        states = {
            warning = 30;
            critical = 15;
        };
        format = "{capacity}% {icon}";
        format-charging = "{capacity}% ";
        format-plugged = "{capacity}% ";
        format-alt = "{time} {icon}";
        format-icons = ["" "" "" "" "" "" "" "" "" ""];
	on-update = "$HOME/.config/waybar/scripts/check_battery.sh";
    };

    tray = {
        icon-size = 16;
        spacing = 0;
    };

      };
    };
  
    style = 
      ''
* {
    border: none;
    font-size: 14px;
    font-family: "JetBrainsMono Nerd Font,JetBrainsMono NF" ;
    min-height: 25px;
}

window#waybar {
  background: transparent;
  margin: 5px;
 }

#custom-logo {
  padding: 0 10px;
}

.modules-right {
  padding-left: 5px;
  border-radius: 15px 0 0 15px;
  margin-top: 2px;
  background: #000000;
}

.modules-center {
  padding: 0 15px;
  margin-top: 2px;
  border-radius: 15px 15px 15px 15px;
  background: #000000;
}

.modules-left {
  border-radius: 0 15px 15px 0;
  margin-top: 2px;
  background: #000000;
}

#battery,
#custom-clipboard,
#custom-colorpicker,
#custom-powerDraw,
#bluetooth,
#pulseaudio,
#network,
#disk,
#memory,
#backlight,
#cpu,
#temperature,
#custom-weather,
#idle_inhibitor,
#jack,
#tray,
#window,
#workspaces,
#clock {
  padding: 0 5px;
}
#pulseaudio {
  padding-top: 3px;
}

#temperature.critical,
#pulseaudio.muted {
  color: #FF0000;
  padding-top: 0;
}




#clock{
  color: #5fd1fa;
}

#battery.charging {
    color: #ffffff;
    background-color: #26A65B;
}

#battery.warning:not(.charging) {
    background-color: #ffbe61;
    color: black;
}

#battery.critical:not(.charging) {
    background-color: #f53c3c;
    color: #ffffff;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
}


@keyframes blink {
    to {
        background-color: #ffffff;
        color: #000000;
    }
}
      '';
  };
}
