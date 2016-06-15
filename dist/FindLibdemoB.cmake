#.rst:
# FindLibdemoB
# -----------
#
# Try to find the LibdemoB demo library
#
# Once done this will define
#
# ::
#
#   LIBDEMOB_FOUND - System has LibdemoB
#   LIBDEMOB_INCLUDE_DIR - The LibdemoB include directory
#   LIBDEMOB_LIBRARIES - The libraries needed to use LibdemoB
#   LIBDEMOB_DEFINITIONS - Compiler switches required for using LibdemoB
#   LIBDEMOB_VERSION_STRING - the version of LibdemoB found (since CMake 2.8.8)

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
PKG_CHECK_MODULES(PC_LIBDEMOB QUIET libdemoB)
set(LIBDEMOB_DEFINITIONS ${PC_LIBDEMOB_CFLAGS_OTHER})

find_path(LIBDEMOB_INCLUDE_DIR NAMES testlibB.h
   HINTS
   ${PC_LIBDEMOB_INCLUDEDIR}
   ${PC_LIBDEMOB_INCLUDE_DIRS}
   PATH_SUFFIXES demotest2
   )

find_library(LIBDEMOB_LIBRARIES NAMES demoB libdemoB
   HINTS
   ${PC_LIBDEMOB_LIBDIR}
   ${PC_LIBDEMOB_LIBRARY_DIRS}
   )

if(PC_LIBDEMOB_VERSION)
    set(LIBDEMOB_VERSION_STRING ${PC_LIBDEMOB_VERSION})
elseif(LIBDEMOB_INCLUDE_DIR AND EXISTS "${LIBDEMOB_INCLUDE_DIR}/libdemoBversion.h")
    file(STRINGS "${LIBDEMOB_INCLUDE_DIR}/libdemoBversion.h" libdemoB_version_str
         REGEX "^#define[\t ]+LIBDEMOB_DOTTED_VERSION[\t ]+\".*\"")

    string(REGEX REPLACE "^#define[\t ]+LIBDEMOB_DOTTED_VERSION[\t ]+\"([^\"]*)\".*" "\\1"
           LIBDEMOB_VERSION_STRING "${libdemoB_version_str}")
    unset(libdemoB_version_str)
endif()

# handle the QUIETLY and REQUIRED arguments and set LIBDEMOB_FOUND to TRUE if
# all listed variables are TRUE
include(${CMAKE_CURRENT_LIST_DIR}/FindPackageHandleStandardArgs.cmake)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(LibdemoB
                                  REQUIRED_VARS LIBDEMOB_LIBRARIES LIBDEMOB_INCLUDE_DIR
                                  VERSION_VAR LIBDEMOB_VERSION_STRING)

mark_as_advanced(LIBDEMOB_INCLUDE_DIR LIBDEMOB_LIBRARIES)
