add_subdirectory( include )

set( LIB_DEMO_SOURCES
    libb.c
)

include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}/include
    ${LIBDEMOA_INCLUDE_DIR}
)

add_library( demoB SHARED ${LIB_DEMO_SOURCES} )
add_library( demoB_static STATIC ${LIB_DEMO_SOURCES} )

# use same version as package
set_target_properties( demoB PROPERTIES VERSION ${DEMOTEST2_VERSION} SOVERSION 0)

install( TARGETS demoB demoB_static
         LIBRARY DESTINATION ${LIB_INSTALL_DIR}
         RUNTIME DESTINATION ${BIN_INSTALL_DIR}
         ARCHIVE DESTINATION ${LIB_INSTALL_DIR}
)
