cmake_minimum_required(VERSION 3.15)

function(createGBATarget)
    if (NOT EXISTS ${DEVKITPRO}/libgba/lib)
        message(FATAL_ERROR "Missing libGBA library files in ${DEVKITPRO}/libgba/lib")
    endif()
    find_library(DEVKITPRO_GBA gba PATHS ${DEVKITPRO}/libgba/lib)
    find_library(DEVKITPRO_MM mm PATHS ${DEVKITPRO}/libgba/lib)
    find_library(DEVKITPRO_FAT fat PATHS ${DEVKITPRO}/libgba/lib)

    # define GBA::CORE
    add_library(GBA::CORE STATIC IMPORTED)
    set_target_properties(GBA::CORE PROPERTIES
        IMPORTED_LOCATION
            ${DEVKITPRO_GBA}
    )
    target_link_directories(GBA::CORE
        INTERFACE
            ${DEVKITARM}/arm-none-eabi/lib
    )
    target_include_directories(GBA::CORE
        INTERFACE
            ${DEVKITPRO}/libgba/include
            ${DEVKITARM}/arm-none-eabi/include
    )

    #define GBA::AUDIO
    add_library(GBA::AUDIO STATIC IMPORTED)
    set_target_properties(GBA::AUDIO PROPERTIES
        IMPORTED_LOCATION
            ${DEVKITPRO_MM}
    )
    target_include_directories(GBA::AUDIO
        INTERFACE
            ${DEVKITPRO}/libgba/include
    )

    #define GBA::FAT
    add_library(GBA::FAT STATIC IMPORTED)
    set_target_properties(GBA::FAT PROPERTIES
        IMPORTED_LOCATION
            ${DEVKITPRO_FAT}
    )
    target_include_directories(GBA::FAT
        INTERFACE
            ${DEVKITPRO}/libgba/include
    )
endfunction()
