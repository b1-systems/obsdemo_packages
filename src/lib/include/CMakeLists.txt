set ( ADEMO_HEADERS
    testlibcommon.h
    testlibA.h
)

install( FILES ${ADEMO_HEADERS}
        DESTINATION include/${CMAKE_PROJECT_NAME}
        PERMISSIONS OWNER_READ GROUP_READ WORLD_READ
)
