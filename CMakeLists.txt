project( demotest2 C )
cmake_minimum_required( VERSION 2.8.8 )
#
set( DEMOTEST2_VERSION 0.2.1 CACHE INTERNAL "demo test2 version" )

set(LIB_INSTALL_DIR lib CACHE STRING "Install location of libraries")
set(BIN_INSTALL_DIR bin CACHE STRING "Install location of executables")

add_subdirectory( src )
add_subdirectory( dist )
