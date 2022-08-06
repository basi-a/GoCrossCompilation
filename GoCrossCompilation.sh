#!/usr/bin/bash
selectOS(){
    echo "Please select the target OS"  
    echo "1. windows, 2. linux, 3. freebsd, 4. darwin"
    read -p "Target OS > " os
    case $os in
        1) echo "selected windows"
        target_os=windows
        ;;
        2) echo "selected linux"
        target_os=linux
        ;;
        3) echo "selected freebsd"
        target_os=freebsd
        ;;
         4) echo "selected darwin"
        target_os=darwin
        ;;
        *) echo "A wrong input !!!"
        exit
        ;;
    esac
}

selectArch(){
    echo "Please select the target CPU architecture"  
    echo "1. amd64, 2. arm, 3. 386"
    read -p "Target CPU ARCH > " arch
    case $arch in
        1) echo "selected amd64"
        target_arch=amd64
        ;;
        2) echo "selected arm"
        target_arch=arm
        ;;
        3) echo "selected 386"
        target_arch=386
        ;;
        *) echo "A wrong input !!!"
        exit
        ;;
    esac
}

inputOutputname(){
    echo "Please input the output name "
    read -p "Outputname > " outputname
}

startBuild(){
    enable=0
    CGO_ENABLED=$enable GOOS=$target_os GOARCH=$target_arch go build -o $outputname $1
}

run(){
    selectOS
    selectArch
    inputOutputname
    startBuild
}
run