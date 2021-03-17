<https://mirrors.bfsu.edu.cn/github-release/llvm/llvm-project>

```
wget https://mirrors.bfsu.edu.cn/github-release/llvm/llvm-project/LatestRelease/llvm-project-11.0.0.tar.xz
```

```
tar xJvf llvm-project-11.0.0.tar.xz
tar xvf llvm-project-11.0.0.tar.xz
```

```
cd llvm-project

mkdir build
cd build

cmake -G "Ninja" ../llvm

cmake -G "Unix Makefiles" -DLLVM_TARGETS_TO_BUILD=X86 -DCMAKE_INSTALL_PREFIX=/home/smith/llvm -DCMAKE_BUILD_TYPE=release ..

make -j 6

make install
make --directory=build install
```

`-DLLVM_TARGETS_TO_BUILD`: Set this equal to the target you wish to build. You may wish to set this to X86; however, you will find a full list of targets within the `llvm-project/llvm/lib/Target` directory.
