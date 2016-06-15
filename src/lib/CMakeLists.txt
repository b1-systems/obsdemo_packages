add_subdirectory( include )

set( LIB_DEMO1_SOURCES
    liba.c
)

include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)

add_library( demoA SHARED ${LIB_DEMO1_SOURCES} )
add_library( demoA_static STATIC ${LIB_DEMO1_SOURCES} )

# use same version as package
set_target_properties( demoA PROPERTIES VERSION ${DEMOTEST1_VERSION} SOVERSION 0)

install( TARGETS demoA demoA_static
         LIBRARY DESTINATION ${LIB_INSTALL_DIR}
         RUNTIME DESTINATION ${BIN_INSTALL_DIR}
         ARCHIVE DESTINATION ${LIB_INSTALL_DIR}
)
