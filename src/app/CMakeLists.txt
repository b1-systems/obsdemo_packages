
set( demotest_SOURCES
    demo3.c
)

include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_SOURCE_DIR}/src/lib/include
    ${LIBDEMOA_INCLUDE_DIR}
    ${LIBDEMOB_INCLUDE_DIR}
)

link_directories(
    ${CMAKE_BINARY_DIR}/src/lib
    ${LIBDEMOB_LIBRARY_DIR}
)

add_executable( demotest3
    ${demotest_SOURCES}
)

target_link_libraries( demotest3
    ${LIBDEMOB_LIBRARIES}
    demoC
)

install( TARGETS demotest3
         RUNTIME DESTINATION ${BIN_INSTALL_DIR}
)
