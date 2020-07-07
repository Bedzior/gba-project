cmake_minimum_required(VERSION 3.15)

function(createGBATarget)
    if (NOT EXISTS ${DEVKITPRO}/libgba/lib)
        message(FATAL_ERROR "Missing libGBA library files in ${DEVKITPRO}/libgba/lib")
    endif()
    find_library(DEVKITPRO_GBA gba PATHS ${DEVKITPRO}/libgba/lib)
    find_library(DEVKITPRO_MM mm PATHS ${DEVKITPRO}/libgba/lib)
    find_library(DEVKITPRO_FAT fat PATHS ${DEVKITPRO}/libgba/lib)

    # define GBA_CORE
    add_library(GBA_CORE STATIC IMPORTED)
    set_target_properties(GBA_CORE PROPERTIES
        IMPORTED_LOCATION
            ${DEVKITPRO_GBA}
    )
    target_link_directories(GBA_CORE
        INTERFACE
            ${DEVKITARM}/arm-none-eabi/lib
    )
    target_include_directories(GBA_CORE
        INTERFACE
            ${DEVKITPRO}/libgba/include
            ${DEVKITARM}/arm-none-eabi/include
    )

    #define GBA_AUDIO
    add_library(GBA_AUDIO STATIC IMPORTED)
    set_target_properties(GBA_AUDIO PROPERTIES
        IMPORTED_LOCATION
            ${DEVKITPRO_MM}
    )
    target_include_directories(GBA_AUDIO
        INTERFACE
            ${DEVKITPRO}/libgba/include
    )

    #define GBA_FAT
    add_library(GBA_FAT STATIC IMPORTED)
    set_target_properties(GBA_FAT PROPERTIES
        IMPORTED_LOCATION
            ${DEVKITPRO_FAT}
    )
    target_include_directories(GBA_FAT
        INTERFACE
            ${DEVKITPRO}/libgba/include
    )
endfunction()
