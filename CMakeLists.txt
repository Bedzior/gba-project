cmake_minimum_required(VERSION 3.15)

set(CMAKE_TOOLCHAIN_FILE
    ${CMAKE_CURRENT_LIST_DIR}/3rdparty/gba-cmake/DevkitArmGBA.cmake)
list(APPEND CMAKE_MODULE_PATH
    ${CMAKE_CURRENT_LIST_DIR}/3rdparty/gba-cmake
    ${CMAKE_CURRENT_LIST_DIR}/cmake
)
enable_language(ASM)
include(ToolsGBA)
include(CommonTools)

set(CMAKE_CXX_STANDARD 17)

project(game)
    createGBATarget()

    add_subdirectory(src/system)

    add_executable(${PROJECT_NAME}.elf
        src/main.cpp
    )
    target_link_libraries(${PROJECT_NAME}.elf
        PRIVATE
            System
            GBA::CORE
    )

    add_gba_executable(${PROJECT_NAME}.elf)
