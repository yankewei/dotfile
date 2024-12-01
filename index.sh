#!/usr/bin/env bash
# Written in [Amber](https://amber-lang.com/)
# version: 0.3.5-alpha
# date: 2024-12-01 23:00:16
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
dir_exist__27_v0() {
    local path=$1
    [ -d "${path}" ];
    __AS=$?;
if [ $__AS != 0 ]; then
        __AF_dir_exist27_v0=0;
        return 0
fi
    __AF_dir_exist27_v0=1;
    return 0
}
file_exist__28_v0() {
    local path=$1
    [ -f "${path}" ];
    __AS=$?;
if [ $__AS != 0 ]; then
        __AF_file_exist28_v0=0;
        return 0
fi
    __AF_file_exist28_v0=1;
    return 0
}
create_dir__33_v0() {
    local path=$1
    dir_exist__27_v0 "${path}";
    __AF_dir_exist27_v0__48_12="$__AF_dir_exist27_v0";
    if [ $(echo  '!' "$__AF_dir_exist27_v0__48_12" | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//') != 0 ]; then
        mkdir -p "${path}";
        __AS=$?
fi
}
make_executable__34_v0() {
    local path=$1
    file_exist__28_v0 "${path}";
    __AF_file_exist28_v0__56_8="$__AF_file_exist28_v0";
    if [ "$__AF_file_exist28_v0__56_8" != 0 ]; then
        chmod +x "${path}";
        __AS=$?
        __AF_make_executable34_v0=1;
        return 0
fi
    echo "The file ${path} doesn't exist"'!'""
    __AF_make_executable34_v0=0;
    return 0
}
is_command__78_v0() {
    local command=$1
    [ -x "$(command -v ${command})" ];
    __AS=$?;
if [ $__AS != 0 ]; then
        __AF_is_command78_v0=0;
        return 0
fi
    __AF_is_command78_v0=1;
    return 0
}
exit__82_v0() {
    local code=$1
    exit "${code}";
    __AS=$?
}
printf__84_v0() {
    local format=$1
    local args=("${!2}")
    args=("${format}" "${args[@]}");
    __AS=$?
    printf "${args[@]}";
    __AS=$?
}
echo_info__91_v0() {
    local message=$1
    __AMBER_ARRAY_1=("${message}");
    printf__84_v0 "\x1b[1;3;97;44m %s \x1b[0m
" __AMBER_ARRAY_1[@];
    __AF_printf84_v0__143_5="$__AF_printf84_v0";
    echo "$__AF_printf84_v0__143_5" > /dev/null 2>&1
}
echo_success__92_v0() {
    local message=$1
    __AMBER_ARRAY_2=("${message}");
    printf__84_v0 "\x1b[1;3;97;42m %s \x1b[0m
" __AMBER_ARRAY_2[@];
    __AF_printf84_v0__148_5="$__AF_printf84_v0";
    echo "$__AF_printf84_v0__148_5" > /dev/null 2>&1
}
error__94_v0() {
    local message=$1
    local exit_code=$2
    __AMBER_ARRAY_3=("${message}");
    printf__84_v0 "\x1b[1;3;97;41m %s \x1b[0m
" __AMBER_ARRAY_3[@];
    __AF_printf84_v0__158_5="$__AF_printf84_v0";
    echo "$__AF_printf84_v0__158_5" > /dev/null 2>&1
    if [ $(echo ${exit_code} '>' 0 | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//') != 0 ]; then
        exit__82_v0 ${exit_code};
        __AF_exit82_v0__159_24="$__AF_exit82_v0";
        echo "$__AF_exit82_v0__159_24" > /dev/null 2>&1
fi
}
download__120_v0() {
    local url=$1
    local path=$2
    is_command__78_v0 "curl";
    __AF_is_command78_v0__10_9="$__AF_is_command78_v0";
    is_command__78_v0 "wget";
    __AF_is_command78_v0__13_9="$__AF_is_command78_v0";
    is_command__78_v0 "aria2c";
    __AF_is_command78_v0__16_9="$__AF_is_command78_v0";
    if [ "$__AF_is_command78_v0__10_9" != 0 ]; then
        curl -L -o "${path}" "${url}";
        __AS=$?
elif [ "$__AF_is_command78_v0__13_9" != 0 ]; then
        wget "${url}" -P "${path}";
        __AS=$?
elif [ "$__AF_is_command78_v0__16_9" != 0 ]; then
        aria2c "${url}" -d "${path}";
        __AS=$?
else
        __AF_download120_v0=0;
        return 0
fi
    __AF_download120_v0=1;
    return 0
}
install_homebrew__133_v0() {
    dir_exist__27_v0 "./tmp";
    __AF_dir_exist27_v0__7_8="$__AF_dir_exist27_v0";
    if [ $(echo "$__AF_dir_exist27_v0__7_8" '!=' 1 | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//') != 0 ]; then
        create_dir__33_v0 "./tmp";
        __AF_create_dir33_v0__8_9="$__AF_create_dir33_v0";
        echo "$__AF_create_dir33_v0__8_9" > /dev/null 2>&1
fi
    local path="./tmp/homebrew.sh"
    file_exist__28_v0 "${path}";
    __AF_file_exist28_v0__12_12="$__AF_file_exist28_v0";
    if [ $(echo  '!' "$__AF_file_exist28_v0__12_12" | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//') != 0 ]; then
        download__120_v0 "https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh" "${path}";
        __AF_download120_v0__13_9="$__AF_download120_v0";
        echo "$__AF_download120_v0__13_9" > /dev/null 2>&1
fi
    make_executable__34_v0 "${path}";
    __AF_make_executable34_v0__16_5="$__AF_make_executable34_v0";
    echo "$__AF_make_executable34_v0__16_5" > /dev/null 2>&1
     bash ${path} ;
    __AS=$?;
if [ $__AS != 0 ]; then
        error__94_v0 "Install homebrew failed" 1;
        __AF_error94_v0__19_9="$__AF_error94_v0";
        echo "$__AF_error94_v0__19_9" > /dev/null 2>&1
fi
    echo_success__92_v0 "Homebrew installed successfully";
    __AF_echo_success92_v0__22_5="$__AF_echo_success92_v0";
    echo "$__AF_echo_success92_v0__22_5" > /dev/null 2>&1
    __AF_install_homebrew133_v0="/opt/homebrew/bin/brew";
    return 0
}
homebrew_software_list__134_v0() {
    __AMBER_ARRAY_4=("maccy,true" "snipaste,true" "wechat,true" "php,false" "deno,false" "redis,false" "composer,false" "sequel-ace,true" "tencent-lemon,true");
    __AF_homebrew_software_list134_v0=("${__AMBER_ARRAY_4[@]}");
    return 0
}
intall_zsh__136_v0() {
    local path="./tmp/zsh.sh"
    download__120_v0 "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh" "${path}";
    __AF_download120_v0__51_5="$__AF_download120_v0";
    echo "$__AF_download120_v0__51_5" > /dev/null 2>&1
     bash ${path} ;
    __AS=$?;
if [ $__AS != 0 ]; then
        error__94_v0 "Install zsh failed" 1;
        __AF_error94_v0__53_9="$__AF_error94_v0";
        echo "$__AF_error94_v0__53_9" > /dev/null 2>&1
fi
}
install_homebrew__133_v0 ;
__AF_install_homebrew133_v0__57_16="${__AF_install_homebrew133_v0}";
__0_brew_bin="${__AF_install_homebrew133_v0__57_16}"
homebrew_software_list__134_v0 ;
__AF_homebrew_software_list134_v0__59_17=("${__AF_homebrew_software_list134_v0[@]}");
__1_brew_list=("${__AF_homebrew_software_list134_v0__59_17[@]}")
index=0;
for brew_sofeware in "${__1_brew_list[@]}"
do
    split__3_v0 "${brew_sofeware}" ",";
    __AF_split3_v0__63_30=("${__AF_split3_v0[@]}");
    name_and_need_cask=("${__AF_split3_v0__63_30[@]}")
    name="${name_and_need_cask[0]}"
    need_cask="${name_and_need_cask[1]}"
    echo_info__91_v0 "Installing ${name}";
    __AF_echo_info91_v0__67_5="$__AF_echo_info91_v0";
    echo "$__AF_echo_info91_v0__67_5" > /dev/null 2>&1
    if [ $([ "_${need_cask}" != "_true" ]; echo $?) != 0 ]; then
         ${__0_brew_bin} install --cask ${name} ;
        __AS=$?;
if [ $__AS != 0 ]; then
            error__94_v0 "Install ${name} failed" 1;
            __AF_error94_v0__72_13="$__AF_error94_v0";
            echo "$__AF_error94_v0__72_13" > /dev/null 2>&1
fi
        echo_success__92_v0 "${name} installed successfully";
        __AF_echo_success92_v0__75_9="$__AF_echo_success92_v0";
        echo "$__AF_echo_success92_v0__75_9" > /dev/null 2>&1
else
         ${__0_brew_bin} install ${name} ;
        __AS=$?;
if [ $__AS != 0 ]; then
            error__94_v0 "Install ${name} failed" 1;
            __AF_error94_v0__78_13="$__AF_error94_v0";
            echo "$__AF_error94_v0__78_13" > /dev/null 2>&1
fi
        echo_success__92_v0 "${name} installed successfully";
        __AF_echo_success92_v0__81_9="$__AF_echo_success92_v0";
        echo "$__AF_echo_success92_v0__81_9" > /dev/null 2>&1
fi
    (( index++ )) || true
done
intall_zsh__136_v0 ;
__AF_intall_zsh136_v0__87_1="$__AF_intall_zsh136_v0";
echo "$__AF_intall_zsh136_v0__87_1" > /dev/null 2>&1
