project(System)

    createLibToncTarget()
    add_library(${PROJECT_NAME} STATIC
        src/System.cpp
        interface/system/System.hpp
    )

    target_include_directories(${PROJECT_NAME}
        PRIVATE
            interface/system
        INTERFACE
            interface
    )

    target_link_libraries(${PROJECT_NAME}
        PUBLIC
            GBA::CORE
    )
