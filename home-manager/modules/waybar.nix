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
        format = "{}°";
        tooltip = true;
        interval = 3600;
        exec = "wttrbar --fahrenheit --mph";
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
        icon-size = 18;
        spacing = 1;
    };

      };
    };
  
    style = ''
@define-color backgroundlight #FFFFFF;
@define-color backgrounddark #FFFFFF;
@define-color workspacesbackground1 #FFFFFF;
@define-color workspacesbackground2 #CCCCCC;
@define-color bordercolor #FFFFFF;
@define-color textcolor1 #000000;
@define-color textcolor2 #000000;
@define-color textcolor3 #FFFFFF;
@define-color iconcolor #FFFFFF;

/* -----------------------------------------------------
 * General 
 * ----------------------------------------------------- */

* {
    font-family: "Fira Sans Semibold", FontAwesome, Roboto, Helvetica, Arial, sans-serif;
    border: none;
    border-radius: 0px;
}

window#waybar {
    background-color: rgba(0,0,0,0.2);
    border-bottom: 0px solid #ffffff;
    /* color: #FFFFFF; */
    transition-property: background-color;
    transition-duration: .5s;
}

/* -----------------------------------------------------
 * Workspaces 
 * ----------------------------------------------------- */

#workspaces {
    margin: 5px 1px 6px 1px;
    padding: 0px 1px;
    border-radius: 15px;
    border: 0px;
    font-weight: bold;
    font-style: normal;
    font-size: 16px;
    color: @textcolor1;
}

#workspaces button {
    padding: 0px 5px;
    margin: 4px 3px;
    border-radius: 15px;
    border: 0px;
    color: @textcolor3;
    transition: all 0.3s ease-in-out;
}

#workspaces button.active {
    color: @textcolor1;
    background: @workspacesbackground2;
    border-radius: 15px;
    min-width: 40px;
    transition: all 0.3s ease-in-out;
}

#workspaces button:hover {
    color: @textcolor1;
    background: @workspacesbackground2;
    border-radius: 15px;
}

/* -----------------------------------------------------
 * Tooltips
 * ----------------------------------------------------- */

tooltip {
    border-radius: 10px;
    background-color: @backgroundlight;
    opacity:0.8;
    padding:20px;
    margin:0px;
}

tooltip label {
    color: @textcolor2;
}

/* -----------------------------------------------------
 * Window
 * ----------------------------------------------------- */

#window {
    background: @backgroundlight;
    margin: 10px 15px 10px 0px;
    padding: 2px 10px 0px 10px;
    border-radius: 12px;
    color:@textcolor2;
    font-size:16px;
    font-weight:normal;
}

window#waybar.empty #window {
    background-color:transparent;
}

/* -----------------------------------------------------
 * Taskbar
 * ----------------------------------------------------- */

#taskbar {
    background: @backgroundlight;
    margin: 6px 15px 6px 0px;
    padding:0px;
    border-radius: 15px;
    font-weight: normal;
    font-style: normal;
    border: 3px solid @backgroundlight;
}

#taskbar button {
    margin:0;
    border-radius: 15px;
    padding: 0px 5px 0px 5px;
}

/* -----------------------------------------------------
 * Modules
 * ----------------------------------------------------- */

.modules-left > widget:first-child > #workspaces {
    margin-left: 0;
}

.modules-right > widget:last-child > #workspaces {
    margin-right: 0;
}

/* -----------------------------------------------------
 * Custom Quicklinks
 * ----------------------------------------------------- */

#custom-brave, 
#custom-browser, 
#custom-keybindings, 
#custom-outlook, 
#custom-filemanager, 
#custom-teams, 
#custom-chatgpt, 
#custom-calculator, 
#custom-windowsvm, 
#custom-cliphist, 
#custom-wallpaper, 
#custom-settings, 
#custom-wallpaper, 
#custom-system,
#custom-hyprshade,
#custom-hypridle,
#custom-waybarthemes {
    margin-right: 23px;
    font-size: 20px;
    font-weight: bold;
    color: @iconcolor;
}
 
#custom-hyprshade {
    margin-right:12px;
}

#custom-hypridle {
    margin-right:16px;
}

#custom-hypridle.active {
    color: @iconcolor;
}

#custom-hypridle.notactive {
    color: #dc2f2f;
}

#custom-waybarthemes,#custom-system {
     margin-right:15px;
}

#custom-ml4w-welcome {
    margin-right: 15px;
    background-image: url("../assets/ml4w-icon.png");
    background-repeat: no-repeat;
    background-position: center;
    padding-right: 24px;
}

/* -----------------------------------------------------
 * Idle Inhibator
 * ----------------------------------------------------- */

 #idle_inhibitor {
    margin-right: 15px;
    font-size: 22px;
    font-weight: bold;
    opacity: 0.8;
    color: @iconcolor;
}

#idle_inhibitor.activated {
    margin-right: 15px;
    font-size: 20px;
    font-weight: bold;
    opacity: 0.8;
    color: #dc2f2f;
}

/* -----------------------------------------------------
 * Custom Modules
 * ----------------------------------------------------- */

#custom-appmenu {
    background-color: @backgrounddark;
    font-size: 16px;
    color: @textcolor1;
    border-radius: 15px;
    padding: 2px 10px 0px 10px;
    margin: 10px 15px 10px 10px;
}

/* -----------------------------------------------------
 * Custom Exit
 * ----------------------------------------------------- */

#custom-exit {
    margin: 0px 20px 0px 0px;
    padding:0px;
    font-size:20px;
    color: @iconcolor;
}

/* -----------------------------------------------------
 * Custom Updates
 * ----------------------------------------------------- */

#custom-updates {
    background-color: @backgroundlight;
    font-size: 16px;
    color: @textcolor2;
    border-radius: 15px;
    padding: 2px 10px 0px 10px;
    margin: 10px 15px 10px 0px;
}

#custom-updates.green {
    background-color: @backgroundlight;
}

#custom-updates.yellow {
    background-color: #ff9a3c;
    color: #FFFFFF;
}

#custom-updates.red {
    background-color: #dc2f2f;
    color: #FFFFFF;
}

/* -----------------------------------------------------
 * Custom Youtube
 * ----------------------------------------------------- */

#custom-youtube {
    background-color: @backgroundlight;
    font-size: 16px;
    color: @textcolor2;
    border-radius: 15px;
    padding: 2px 10px 0px 10px;
    margin: 10px 15px 10px 0px;
}

/* -----------------------------------------------------
 * Hardware Group
 * ----------------------------------------------------- */

 #disk,#memory,#cpu,#language {
    margin:0px;
    padding:0px;
    font-size:16px;
    color:@iconcolor;
}

#language {
    margin-right:10px;
}

/* -----------------------------------------------------
 * Clock
 * ----------------------------------------------------- */

#clock {
    background-color: @backgrounddark;
    font-size: 16px;
    color: @textcolor1;
    border-radius: 15px;
    padding: 2px 10px 0px 10px;
    margin: 10px 15px 10px 0px;
}

/* -----------------------------------------------------
 * Pulseaudio
 * ----------------------------------------------------- */

#pulseaudio {
    background-color: @backgroundlight;
    font-size: 16px;
    color: @textcolor2;
    border-radius: 15px;
    padding: 2px 10px 0px 10px;
    margin: 10px 15px 10px 0px;
}

#pulseaudio.muted {
    background-color: @backgrounddark;
    color: @textcolor1;
}

/* -----------------------------------------------------
 * Network
 * ----------------------------------------------------- */

#network {
    background-color: @backgroundlight;
    font-size: 16px;
    color: @textcolor2;
    border-radius: 15px;
    padding: 2px 10px 0px 10px;
    margin: 10px 15px 10px 0px;
}

#network.ethernet {
    background-color: @backgroundlight;
    color: @textcolor2;
}

#network.wifi {
    background-color: @backgroundlight;
    color: @textcolor2;
}

/* -----------------------------------------------------
 * Bluetooth
 * ----------------------------------------------------- */

 #bluetooth, #bluetooth.on, #bluetooth.connected {
    background-color: @backgroundlight;
    font-size: 16px;
    color: @textcolor2;
    border-radius: 15px;
    padding: 2px 10px 0px 10px;
    margin: 10px 15px 10px 0px;
}

#bluetooth.off {
    background-color: transparent;
    padding: 0px;
    margin: 0px;
}

/* -----------------------------------------------------
 * Battery
 * ----------------------------------------------------- */

#battery {
    background-color: @backgroundlight;
    font-size: 16px;
    color: @textcolor2;
    border-radius: 15px;
    padding: 2px 15px 0px 10px;
    margin: 10px 15px 10px 0px;
}

#battery.charging, #battery.plugged {
    color: @textcolor2;
    background-color: @backgroundlight;
}

@keyframes blink {
    to {
        background-color: @backgroundlight;
        color: @textcolor2;
    }
}

#battery.critical:not(.charging) {
    background-color: #f53c3c;
    color: @textcolor3;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
}

/* -----------------------------------------------------
 * Tray
 * ----------------------------------------------------- */

#tray {
    margin:0px 10px 0px 0px;
}

#tray > .passive {
    -gtk-icon-effect: dim;
}

#tray > .needs-attention {
    -gtk-icon-effect: highlight;
    background-color: #eb4d4b;
}

/* -----------------------------------------------------
 * Other
 * ----------------------------------------------------- */

label:focus {
    background-color: #000000;
}

#backlight {
    background-color: #90b1b1;
}

#network {
    background-color: #2980b9;
}

#network.disconnected {
    background-color: #f53c3c;
}
      '';
  };
}
