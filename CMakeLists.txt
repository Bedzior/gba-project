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

project(game)
    createGBATarget()
    add_executable(${PROJECT_NAME}.elf
        src/main.cpp
    )
    add_gba_executable(${PROJECT_NAME}.elf)

    target_link_libraries(${PROJECT_NAME}.elf GBA::CORE)
