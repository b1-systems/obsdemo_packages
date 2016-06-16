project( demotest3 C )
cmake_minimum_required( VERSION 2.8.8 )
#
set( DEMOTEST3_VERSION 0.1.0 CACHE INTERNAL "demo test3 version" )

set(LIB_INSTALL_DIR lib CACHE STRING "Install location of libraries")
set(BIN_INSTALL_DIR bin CACHE STRING "Install location of executables")

add_subdirectory( src )
add_subdirectory( dist )
