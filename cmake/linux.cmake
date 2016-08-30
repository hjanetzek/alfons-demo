add_definitions(-DPLATFORM_LINUX)

append(CMAKE_CXX_FLAGS "-std=c++14")
append(CMAKE_CXX_FLAGS "-Wall")
append(CMAKE_CXX_FLAGS "-Wno-reorder")
append(CMAKE_CXX_FLAGS "-Wno-comment")
append(CMAKE_CXX_FLAGS "-Wno-unused-function")
append(CMAKE_CXX_FLAGS "-fno-omit-frame-pointer")

### Use static libs
set(HARFBUZZ_BUILD_ICU ON CACHE BOOL "Enable building of ICU")
set(HARFBUZZ_BUILD_UCDN ON CACHE BOOL "Enable building of UCDN")

add_subdirectory(${PROJECT_SOURCE_DIR}/harfbuzz-icu-freetype)

message(STATUS "harfbuzz" ${HARFBUZZ_LIBRARIES})

set(ALFONS_DEPS_LIBRARIES
  ${ALFONS_DEPS_LIBRARIES}
  harfbuzz ${HARFBUZZ_LIBRARIES}
CACHE INTERNAL "alfons-libs" FORCE)

### TODO Use system libs
# find_package(PkgConfig REQUIRED)
# pkg_search_module(HARFBUZZ REQUIRED harfbuzz)
# pkg_search_module(ICU REQUIRED icu-uc)
# pkg_search_module(FREETYPE REQUIRED freetype2)

set(ALFONS_DEPS_INCLUDE_DIRS
  ${PROJECT_SOURCE_DIR}/alfons/deps
  ${PROJECT_SOURCE_DIR}/alfons/src/logger

  # ${FREETYPE_INCLUDE_DIRS}
  # ${HARFBUZZ_INCLUDE_DIRS}
  # ${ICU_INCLUDE_DIRS}
  CACHE INTERNAL "includes" FORCE)

# set(ALFONS_DEPS_LIBRARIES
#   ${FREETYPE_LIBRARIES}
#   ${HARFBUZZ_LIBRARIES}
#   ${ICU_LIBRARIES}
#   CACHE INTERNAL "libs" FORCE
# )

set(ALFONS_DEPS_LIBRARIES
  harfbuzz ${HARFBUZZ_LIBRARIES}
  CACHE INTERNAL "libs" FORCE)

find_package(OpenGL REQUIRED)

set(ALFONS_RENDER_DEPS_INCLUDE_DIRS
  ${OPENGL_INCLUDE_DIRS})

set(ALFONS_RENDER_DEPS_LIBRARIES
  ${OPENGL_LIBRARIES})

add_subdirectory(${PROJECT_SOURCE_DIR}/alfons)

add_subdirectory(${PROJECT_SOURCE_DIR}/src)
