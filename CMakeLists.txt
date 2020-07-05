cmake_minimum_required(VERSION 3.14.0)

set(CMAKE_TOOLCHAIN_FILE ${CMAKE_CURRENT_LIST_DIR}/vendor/3ds-cmake/DevkitArmGBA.cmake)
list(APPEND CMAKE_MODULE_PATH
    ${CMAKE_CURRENT_LIST_DIR}/vendor/3ds-cmake/cmake
    ${CMAKE_CURRENT_LIST_DIR}/cmake
)
enable_language(ASM)
include(ToolsGBA)
include(CommonTools)

project(game C CXX ASM)
    createGBATarget()
    add_executable(${PROJECT_NAME}.elf
        src/main.cpp
    )
    target_link_libraries(${PROJECT_NAME}.elf gba mm)

    add_gba_executable(${PROJECT_NAME}.elf)
