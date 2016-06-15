#
include(FindPkgConfig QUIET)
if(PKG_CONFIG_FOUND)
    # Produce a pkg-config file for linking against the shared lib
    configure_file("demotest1.pc.in" "demotest1.pc" @ONLY)
    install(FILES "${CMAKE_CURRENT_BINARY_DIR}/demotest1.pc"
        DESTINATION "${LIB_INSTALL_DIR}/pkgconfig")
endif()
install(FILES FindLibdemoA.cmake DESTINATION "${CMAKE_ROOT}/Modules")
