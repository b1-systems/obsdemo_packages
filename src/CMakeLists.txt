# need common include
find_package( LibdemoA REQUIRED)
find_package( LibdemoB REQUIRED)
message( STATUS "LIBDEMOA_FOUND: ${LIBDEMOA_FOUND}")
message( STATUS "LIBDEMOB_FOUND: ${LIBDEMOB_FOUND}")

add_subdirectory( lib )
add_subdirectory( app )
