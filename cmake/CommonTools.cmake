function(createGBATarget)
    if (NOT EXISTS ${DEVKITPRO}/libgba/lib)
        message(FATAL_ERROR "Missing libGBA library files in ${DEVKITPRO}/libgba/lib")
    endif()
    find_library(DEVKITPRO_GBA gba PATHS ${DEVKITPRO}/libgba/lib)
    find_library(DEVKITPRO_MM mm PATHS ${DEVKITPRO}/libgba/lib)
    find_library(DEVKITPRO_FAT fat PATHS ${DEVKITPRO}/libgba/lib)

    add_library(gba INTERFACE)
    target_link_libraries(gba
        INTERFACE
            ${DEVKITPRO_FAT}
            ${DEVKITPRO_GBA}
            ${DEVKITPRO_MM}
    )
    target_include_directories(gba
        INTERFACE
            ${DEVKITPRO}/libgba/include
            ${DEVKITARM}/arm-none-eabi/include
    )
endfunction()
