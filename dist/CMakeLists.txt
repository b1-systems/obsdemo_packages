#
include(FindPkgConfig QUIET)
if(PKG_CONFIG_FOUND)
    # Produce a pkg-config file for linking against the shared lib
    configure_file("demotest2.pc.in" "demotest2.pc" @ONLY)
    install(FILES "${CMAKE_CURRENT_BINARY_DIR}/demotest2.pc"
        DESTINATION "${LIB_INSTALL_DIR}/pkgconfig")
endif()
install(FILES FindLibdemoB.cmake DESTINATION "${CMAKE_ROOT}/Modules")
