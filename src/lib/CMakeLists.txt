add_subdirectory( include )

set( LIB_DEMO_SOURCES
    libc.c
)

include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}/include
    ${LIBDEMOA_INCLUDE_DIR}
)

add_library( demoC SHARED ${LIB_DEMO_SOURCES} )
add_library( demoC_static STATIC ${LIB_DEMO_SOURCES} )

# use same version as package
set_target_properties( demoC PROPERTIES VERSION ${DEMOTEST3_VERSION} SOVERSION 0)

install( TARGETS demoC demoC_static
         LIBRARY DESTINATION ${LIB_INSTALL_DIR}
         RUNTIME DESTINATION ${BIN_INSTALL_DIR}
         ARCHIVE DESTINATION ${LIB_INSTALL_DIR}
)
