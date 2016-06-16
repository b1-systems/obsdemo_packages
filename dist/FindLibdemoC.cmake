#.rst:
# FindLibdemoC
# -----------
#
# Try to find the LibdemoC demo library
#
# Once done this will define
#
# ::
#
#   LIBDEMOC_FOUND - System has LibdemoC
#   LIBDEMOC_INCLUDE_DIR - The LibdemoC include directory
#   LIBDEMOC_LIBRARIES - The libraries needed to use LibdemoC
#   LIBDEMOC_DEFINITIONS - Compiler switches required for using LibdemoC
#   LIBDEMOC_VERSION_STRING - the version of LibdemoC found (since CMake 2.8.8)

#=============================================================================
# Copyright 2006-2009 Kitware, Inc.
# Copyright 2006 Alexander Neundorf <neundorf@kde.org>
#
# Distributed under the OSI-approved BSD License (the "License");
# see accompanying file Copyright.txt for details.
#
# This software is distributed WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the License for more information.
#=============================================================================
# (To distribute this file outside of CMake, substitute the full
#  License text for the above reference.)

# use pkg-config to get the directories and then use these values
# in the find_path() and find_library() calls
find_package(PkgConfig QUIET)
PKG_CHECK_MODULES(PC_LIBDEMOC QUIET libdemoC)
set(LIBDEMOC_DEFINITIONS ${PC_LIBDEMOC_CFLAGS_OTHER})

find_path(LIBDEMOC_INCLUDE_DIR NAMES testlibB.h
   HINTS
   ${PC_LIBDEMOC_INCLUDEDIR}
   ${PC_LIBDEMOC_INCLUDE_DIRS}
   PATH_SUFFIXES demotest3
   )

find_library(LIBDEMOC_LIBRARIES NAMES demoC libdemoC
   HINTS
   ${PC_LIBDEMOC_LIBDIR}
   ${PC_LIBDEMOC_LIBRARY_DIRS}
   )

if(PC_LIBDEMOC_VERSION)
    set(LIBDEMOC_VERSION_STRING ${PC_LIBDEMOC_VERSION})
elseif(LIBDEMOC_INCLUDE_DIR AND EXISTS "${LIBDEMOC_INCLUDE_DIR}/libdemoCversion.h")
    file(STRINGS "${LIBDEMOC_INCLUDE_DIR}/libdemoCversion.h" libdemoC_version_str
         REGEX "^#define[\t ]+LIBDEMOC_DOTTED_VERSION[\t ]+\".*\"")

    string(REGEX REPLACE "^#define[\t ]+LIBDEMOC_DOTTED_VERSION[\t ]+\"([^\"]*)\".*" "\\1"
           LIBDEMOC_VERSION_STRING "${libdemoC_version_str}")
    unset(libdemoC_version_str)
endif()

# handle the QUIETLY and REQUIRED arguments and set LIBDEMOC_FOUND to TRUE if
# all listed variables are TRUE
include(${CMAKE_CURRENT_LIST_DIR}/FindPackageHandleStandardArgs.cmake)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(LibdemoC
                                  REQUIRED_VARS LIBDEMOC_LIBRARIES LIBDEMOC_INCLUDE_DIR
                                  VERSION_VAR LIBDEMOC_VERSION_STRING)

mark_as_advanced(LIBDEMOC_INCLUDE_DIR LIBDEMOC_LIBRARIES)
