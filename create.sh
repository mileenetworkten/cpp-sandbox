function createForPlatform {
    BUILD_TYPE=$1

    rm -rf project
    mkdir project
    cd project

    if [ "${BUILD_TYPE}" == "r" ]; then
        cmake -DCMAKE_BUILD_TYPE=Release ..
    else
        cmake -DCMAKE_BUILD_TYPE=Debug ..
    fi
}

case $1 in
    w)  echo "*************** installing windows scripts *************** "
        createForPlatform $2
        start ./cpp-playground.vcxproj
        ;;
    m)  echo "*************** installing mac scripts *************** "
        createForPlatform $2
        ;;
    l)  echo "*************** installing linux scripts - assuming ubuntu18.04 *************** "
        createForPlatform $2
        ;;
    *)
        echo "*************** Required argument missing"
        echo "*************** use an argument of either w/l/m for windows/linux/mac | Example usage: sh install.sh m or ./install.sh l *************** "
        ;;
esac
