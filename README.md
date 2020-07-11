# My first GBA project

## Introduction
Howdy, stranger!

My long-time fascination, Game Boy Advance games, emulation and development are finally in my reach.
I wanted to create this project to have a neat template to work with a CMake-supporting, modern C++ scaffolding project ready when an idea finally coalesces in my head.

## Building and running
### Windows
From the project's root directory, simply run:
```powershell
./scripts/build.ps1 -buildConfig Release
```

### Linux
Probably coming soon.

## 3rd parties
### [3ds-cmake](https://github.com/Xantasia/3ds-cmake)
Many thanks to [@Xantasia](https://github.com/Xantasia) for providing a comprehensive CMake tool set for calling devkitPro's tools and an example of including their binaries and header files.
The latter was a major inspiration for a starting point, so kudos to them!

The project's files reside in [`3rdparty/gba-cmake`](3rdparty/gba-cmake) and are all covered by [respective license](3rdparty/gba-cmake/LICENSE).
