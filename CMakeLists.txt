cmake_minimum_required(VERSION 3.6)
project(sqrt VERSION 0.1 LANGUAGES Fortran C)

if(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
  set(CMAKE_MACOSX_RPATH 1)
endif()

add_library(newtonraphson SHARED ${CMAKE_CURRENT_LIST_DIR}/newtonraphson.c)
set_target_properties(newtonraphson PROPERTIES VERSION ${PROJECT_VERSION} SOVERSION 1)

set(SOURCES ${CMAKE_CURRENT_LIST_DIR}/sqrt.f90 ${CMAKE_CURRENT_LIST_DIR}/newtonraphson.c)

add_executable(sqrt ${SOURCES})
target_link_libraries(sqrt newtonraphson)
