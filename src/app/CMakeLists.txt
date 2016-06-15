
set( demotest1_SOURCES
    demo1.c
)

include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_SOURCE_DIR}/src/lib/include
)

link_directories( ${CMAKE_BINARY_DIR}/src/lib )

add_executable( demotest1
    ${demotest1_SOURCES}
)

target_link_libraries( demotest1
    demoA
)

install( TARGETS demotest1
         RUNTIME DESTINATION ${BIN_INSTALL_DIR}
)
