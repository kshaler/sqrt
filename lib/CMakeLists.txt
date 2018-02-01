cmake_minimum_required(VERSION 3.6)
project(newtonraphson VERSION 0.1 LANGUAGES Fortran C)

if(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
  set(CMAKE_MACOSX_RPATH 1)
endif()

# compile the c version of the newton raphson library
include_directories(include)
set(SOURCES newtonraphson.c)
add_library(newtonraphson_c SHARED ${SOURCES})
set_target_properties(newtonraphson_c PROPERTIES VERSION ${PROJECT_VERSION} SOVERSION 1)

# compile the f90 version of the newton raphson library
set(SOURCES newtonraphson.f90)
add_library(newtonraphson_f90 SHARED ${SOURCES})
set_target_properties(newtonraphson_f90 PROPERTIES VERSION ${PROJECT_VERSION} SOVERSION 1)
