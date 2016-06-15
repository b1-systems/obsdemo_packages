# need common include
find_package( LibdemoA REQUIRED)
message( STATUS "LIBDEMOA_FOUND: ${LIBDEMOA_FOUND}")

add_subdirectory( lib )
add_subdirectory( app )
