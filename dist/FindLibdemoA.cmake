#.rst:
# FindLibdemoA
# -----------
#
# Try to find the LibdemoA demo library
#
# Once done this will define
#
# ::
#
#   LIBDEMOA_FOUND - System has LibdemoA
#   LIBDEMOA_INCLUDE_DIR - The LibdemoA include directory
#   LIBDEMOA_LIBRARIES - The libraries needed to use LibdemoA
#   LIBDEMOA_DEFINITIONS - Compiler switches required for using LibdemoA
#   LIBDEMOA_VERSION_STRING - the version of LibdemoA found (since CMake 2.8.8)

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
PKG_CHECK_MODULES(PC_LIBDEMOA QUIET libdemoA)
set(LIBDEMOA_DEFINITIONS ${PC_LIBDEMOA_CFLAGS_OTHER})

message(STATUS "PC_LIBDEMOA_INCLUDEDIR=${PC_LIBDEMOA_INCLUDEDIR} PC_LIBDEMOA_INCLUDE_DIRS=${PC_LIBDEMOA_INCLUDE_DIRS}")

find_path(LIBDEMOA_INCLUDE_DIR NAMES testlibcommon.h
   HINTS
   ${PC_LIBDEMOA_INCLUDEDIR}
   ${PC_LIBDEMOA_INCLUDE_DIRS}
   PATH_SUFFIXES demotest1
   )

find_library(LIBDEMOA_LIBRARIES NAMES demoA libdemoA
   HINTS
   ${PC_LIBDEMOA_LIBDIR}
   ${PC_LIBDEMOA_LIBRARY_DIRS}
   )

if(PC_LIBDEMOA_VERSION)
    set(LIBDEMOA_VERSION_STRING ${PC_LIBDEMOA_VERSION})
elseif(LIBDEMOA_INCLUDE_DIR AND EXISTS "${LIBDEMOA_INCLUDE_DIR}/libdemoAversion.h")
    file(STRINGS "${LIBDEMOA_INCLUDE_DIR}/libdemoAversion.h" libdemoA_version_str
         REGEX "^#define[\t ]+LIBDEMOA_DOTTED_VERSION[\t ]+\".*\"")

    string(REGEX REPLACE "^#define[\t ]+LIBDEMOA_DOTTED_VERSION[\t ]+\"([^\"]*)\".*" "\\1"
           LIBDEMOA_VERSION_STRING "${libdemoA_version_str}")
    unset(libdemoA_version_str)
endif()

# handle the QUIETLY and REQUIRED arguments and set LIBDEMOA_FOUND to TRUE if
# all listed variables are TRUE
include(${CMAKE_CURRENT_LIST_DIR}/FindPackageHandleStandardArgs.cmake)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(LibdemoA
                                  REQUIRED_VARS LIBDEMOA_LIBRARIES LIBDEMOA_INCLUDE_DIR
                                  VERSION_VAR LIBDEMOA_VERSION_STRING)

mark_as_advanced(LIBDEMOA_INCLUDE_DIR LIBDEMOA_LIBRARIES)
