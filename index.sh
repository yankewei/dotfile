#!/usr/bin/env bash
# Written in [Amber](https://amber-lang.com/)
# version: 0.3.5-alpha
# date: 2024-12-02 21:10:29
split__3_v0() {
    local text=$1
    local delimiter=$2
    __AMBER_ARRAY_0=();
    local result=("${__AMBER_ARRAY_0[@]}")
    IFS="${delimiter}" read -rd '' -a result < <(printf %s "$text");
    __AS=$?
    __AF_split3_v0=("${result[@]}");
    return 0
}
dir_exist__26_v0() {
    local path=$1
    [ -d "${path}" ];
    __AS=$?;
if [ $__AS != 0 ]; then
        __AF_dir_exist26_v0=0;
        return 0
fi
    __AF_dir_exist26_v0=1;
    return 0
}
file_exist__27_v0() {
    local path=$1
    [ -f "${path}" ];
    __AS=$?;
if [ $__AS != 0 ]; then
        __AF_file_exist27_v0=0;
        return 0
fi
    __AF_file_exist27_v0=1;
    return 0
}
create_dir__32_v0() {
    local path=$1
    dir_exist__26_v0 "${path}";
    __AF_dir_exist26_v0__48_12="$__AF_dir_exist26_v0";
    if [ $(echo  '!' "$__AF_dir_exist26_v0__48_12" | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//') != 0 ]; then
        mkdir -p "${path}";
        __AS=$?
fi
}
make_executable__33_v0() {
    local path=$1
    file_exist__27_v0 "${path}";
    __AF_file_exist27_v0__56_8="$__AF_file_exist27_v0";
    if [ "$__AF_file_exist27_v0__56_8" != 0 ]; then
        chmod +x "${path}";
        __AS=$?
        __AF_make_executable33_v0=1;
        return 0
fi
    echo "The file ${path} doesn't exist"'!'""
    __AF_make_executable33_v0=0;
    return 0
}
is_command__77_v0() {
    local command=$1
    [ -x "$(command -v ${command})" ];
    __AS=$?;
if [ $__AS != 0 ]; then
        __AF_is_command77_v0=0;
        return 0
fi
    __AF_is_command77_v0=1;
    return 0
}
exit__81_v0() {
    local code=$1
    exit "${code}";
    __AS=$?
}
printf__83_v0() {
    local format=$1
    local args=("${!2}")
    args=("${format}" "${args[@]}");
    __AS=$?
    printf "${args[@]}";
    __AS=$?
}
echo_info__90_v0() {
    local message=$1
    __AMBER_ARRAY_1=("${message}");
    printf__83_v0 "\x1b[1;3;97;44m %s \x1b[0m
" __AMBER_ARRAY_1[@];
    __AF_printf83_v0__143_5="$__AF_printf83_v0";
    echo "$__AF_printf83_v0__143_5" > /dev/null 2>&1
}
echo_success__91_v0() {
    local message=$1
    __AMBER_ARRAY_2=("${message}");
    printf__83_v0 "\x1b[1;3;97;42m %s \x1b[0m
" __AMBER_ARRAY_2[@];
    __AF_printf83_v0__148_5="$__AF_printf83_v0";
    echo "$__AF_printf83_v0__148_5" > /dev/null 2>&1
}
error__93_v0() {
    local message=$1
    local exit_code=$2
    __AMBER_ARRAY_3=("${message}");
    printf__83_v0 "\x1b[1;3;97;41m %s \x1b[0m
" __AMBER_ARRAY_3[@];
    __AF_printf83_v0__158_5="$__AF_printf83_v0";
    echo "$__AF_printf83_v0__158_5" > /dev/null 2>&1
    if [ $(echo ${exit_code} '>' 0 | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//') != 0 ]; then
        exit__81_v0 ${exit_code};
        __AF_exit81_v0__159_24="$__AF_exit81_v0";
        echo "$__AF_exit81_v0__159_24" > /dev/null 2>&1
fi
}
download__119_v0() {
    local url=$1
    local path=$2
    is_command__77_v0 "curl";
    __AF_is_command77_v0__10_9="$__AF_is_command77_v0";
    is_command__77_v0 "wget";
    __AF_is_command77_v0__13_9="$__AF_is_command77_v0";
    is_command__77_v0 "aria2c";
    __AF_is_command77_v0__16_9="$__AF_is_command77_v0";
    if [ "$__AF_is_command77_v0__10_9" != 0 ]; then
        curl -L -o "${path}" "${url}";
        __AS=$?
elif [ "$__AF_is_command77_v0__13_9" != 0 ]; then
        wget "${url}" -P "${path}";
        __AS=$?
elif [ "$__AF_is_command77_v0__16_9" != 0 ]; then
        aria2c "${url}" -d "${path}";
        __AS=$?
else
        __AF_download119_v0=0;
        return 0
fi
    __AF_download119_v0=1;
    return 0
}
install_homebrew__128_v0() {
    dir_exist__26_v0 "./tmp";
    __AF_dir_exist26_v0__7_8="$__AF_dir_exist26_v0";
    if [ $(echo "$__AF_dir_exist26_v0__7_8" '!=' 1 | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//') != 0 ]; then
        create_dir__32_v0 "./tmp";
        __AF_create_dir32_v0__8_9="$__AF_create_dir32_v0";
        echo "$__AF_create_dir32_v0__8_9" > /dev/null 2>&1
fi
    local path="./tmp/homebrew.sh"
    file_exist__27_v0 "${path}";
    __AF_file_exist27_v0__12_12="$__AF_file_exist27_v0";
    if [ $(echo  '!' "$__AF_file_exist27_v0__12_12" | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//') != 0 ]; then
        download__119_v0 "https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh" "${path}";
        __AF_download119_v0__13_9="$__AF_download119_v0";
        echo "$__AF_download119_v0__13_9" > /dev/null 2>&1
fi
    make_executable__33_v0 "${path}";
    __AF_make_executable33_v0__16_5="$__AF_make_executable33_v0";
    echo "$__AF_make_executable33_v0__16_5" > /dev/null 2>&1
     bash ${path} ;
    __AS=$?;
if [ $__AS != 0 ]; then
        error__93_v0 "Install homebrew failed" 1;
        __AF_error93_v0__19_9="$__AF_error93_v0";
        echo "$__AF_error93_v0__19_9" > /dev/null 2>&1
fi
    echo_success__91_v0 "Homebrew installed successfully";
    __AF_echo_success91_v0__22_5="$__AF_echo_success91_v0";
    echo "$__AF_echo_success91_v0__22_5" > /dev/null 2>&1
    __AF_install_homebrew128_v0="/opt/homebrew/bin/brew";
    return 0
}
homebrew_software_list__129_v0() {
    __AMBER_ARRAY_4=("maccy,true" "snipaste,true" "wechat,true" "php,false" "deno,false" "redis,false" "composer,false" "sequel-ace,true" "tencent-lemon,true" "another-redis-desktop-manager,true");
    __AF_homebrew_software_list129_v0=("${__AMBER_ARRAY_4[@]}");
    return 0
}
install_amber__130_v0() {
    local path="./tmp/amber.sh"
    download__119_v0 "https://raw.githubusercontent.com/amber-lang/amber/master/setup/install.sh" "${path}";
    __AF_download119_v0__44_5="$__AF_download119_v0";
    echo "$__AF_download119_v0__44_5" > /dev/null 2>&1
     bash ${path} ;
    __AS=$?;
if [ $__AS != 0 ]; then
        error__93_v0 "Install amber failed" 1;
        __AF_error93_v0__46_9="$__AF_error93_v0";
        echo "$__AF_error93_v0__46_9" > /dev/null 2>&1
fi
}
intall_zsh__131_v0() {
    local path="./tmp/zsh.sh"
    download__119_v0 "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh" "${path}";
    __AF_download119_v0__52_5="$__AF_download119_v0";
    echo "$__AF_download119_v0__52_5" > /dev/null 2>&1
     bash ${path} ;
    __AS=$?;
if [ $__AS != 0 ]; then
        error__93_v0 "Install zsh failed" 1;
        __AF_error93_v0__54_9="$__AF_error93_v0";
        echo "$__AF_error93_v0__54_9" > /dev/null 2>&1
fi
}
install_homebrew__128_v0 ;
__AF_install_homebrew128_v0__58_16="${__AF_install_homebrew128_v0}";
__0_brew_bin="${__AF_install_homebrew128_v0__58_16}"
homebrew_software_list__129_v0 ;
__AF_homebrew_software_list129_v0__60_17=("${__AF_homebrew_software_list129_v0[@]}");
__1_brew_list=("${__AF_homebrew_software_list129_v0__60_17[@]}")
index=0;
for brew_sofeware in "${__1_brew_list[@]}"
do
    split__3_v0 "${brew_sofeware}" ",";
    __AF_split3_v0__64_30=("${__AF_split3_v0[@]}");
    name_and_need_cask=("${__AF_split3_v0__64_30[@]}")
    name="${name_and_need_cask[0]}"
    need_cask="${name_and_need_cask[1]}"
    echo_info__90_v0 "Installing ${name}";
    __AF_echo_info90_v0__68_5="$__AF_echo_info90_v0";
    echo "$__AF_echo_info90_v0__68_5" > /dev/null 2>&1
    if [ $([ "_${need_cask}" != "_true" ]; echo $?) != 0 ]; then
         ${__0_brew_bin} install --cask ${name} ;
        __AS=$?;
if [ $__AS != 0 ]; then
            error__93_v0 "Install ${name} failed" 1;
            __AF_error93_v0__73_13="$__AF_error93_v0";
            echo "$__AF_error93_v0__73_13" > /dev/null 2>&1
fi
        echo_success__91_v0 "${name} installed successfully";
        __AF_echo_success91_v0__76_9="$__AF_echo_success91_v0";
        echo "$__AF_echo_success91_v0__76_9" > /dev/null 2>&1
else
         ${__0_brew_bin} install ${name} ;
        __AS=$?;
if [ $__AS != 0 ]; then
            error__93_v0 "Install ${name} failed" 1;
            __AF_error93_v0__79_13="$__AF_error93_v0";
            echo "$__AF_error93_v0__79_13" > /dev/null 2>&1
fi
        echo_success__91_v0 "${name} installed successfully";
        __AF_echo_success91_v0__82_9="$__AF_echo_success91_v0";
        echo "$__AF_echo_success91_v0__82_9" > /dev/null 2>&1
fi
    (( index++ )) || true
done
intall_zsh__131_v0 ;
__AF_intall_zsh131_v0__86_1="$__AF_intall_zsh131_v0";
echo "$__AF_intall_zsh131_v0__86_1" > /dev/null 2>&1
install_amber__130_v0 ;
__AF_install_amber130_v0__88_1="$__AF_install_amber130_v0";
echo "$__AF_install_amber130_v0__88_1" > /dev/null 2>&1
