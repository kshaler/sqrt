cmake_minimum_required(VERSION 3.6)
project(sqrt VERSION 0.1 LANGUAGES Fortran C)

if(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
  set(CMAKE_MACOSX_RPATH 1)
endif()

# if using the fortran library
# set(PROJECT_LINK_LIBS libnewtonraphson_f90.dylib)
# include_directories(build_lib)

# if using the c library
set(PROJECT_LINK_LIBS libnewtonraphson_c.dylib)

link_directories(build_lib)
set(SOURCES src/sqrt.f90)
add_executable(sqrt ${SOURCES})
target_link_libraries(sqrt ${PROJECT_LINK_LIBS})
