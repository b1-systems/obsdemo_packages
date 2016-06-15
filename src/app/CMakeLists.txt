
set( demotest_SOURCES
    demo2.c
)

include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_SOURCE_DIR}/src/lib/include
    ${LIBDEMOA_INCLUDE_DIR}
)

link_directories(
    ${CMAKE_BINARY_DIR}/src/lib
)

add_executable( demotest2
    ${demotest_SOURCES}
)

target_link_libraries( demotest2
    demoB
)

install( TARGETS demotest2
         RUNTIME DESTINATION ${BIN_INSTALL_DIR}
)
