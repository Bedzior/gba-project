function(createGBATarget)
    add_library(gba INTERFACE)
    target_link_libraries(gba
        INTERFACE
            -L${DEVKITPRO}/libgba/lib
    )
    target_include_directories(gba
        INTERFACE
            ${DEVKITPRO}/libgba/include
            ${DEVKITARM}/arm-none-eabi/include
    )
endfunction()
