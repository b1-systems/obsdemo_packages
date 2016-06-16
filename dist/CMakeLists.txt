#
include(FindPkgConfig QUIET)
if(PKG_CONFIG_FOUND)
    # Produce a pkg-config file for linking against the shared lib
    configure_file("demotest3.pc.in" "demotest3.pc" @ONLY)
    install(FILES "${CMAKE_CURRENT_BINARY_DIR}/demotest3.pc"
        DESTINATION "${LIB_INSTALL_DIR}/pkgconfig")
endif()
install(FILES FindLibdemoC.cmake DESTINATION "${CMAKE_ROOT}/Modules")
