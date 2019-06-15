project(Aglais LANGUAGES CXX)
cmake_minimum_required(VERSION 2.7)

include_directories(
   "${CMAKE_SOURCE_DIR}/.."
   "src"
   "src/v1"
)

set(aglais_src
   "src/Aglais.cpp"
   "src/v1/Parser.cpp"
)

set_source_files_properties(${aglais_src} PROPERTIES COMPILE_DEFINITIONS "KALEIDOSCOPE_VIRTUAL_BUILD=1")

add_library(aglais SHARED ${aglais_src})

set(aglais_compress_src
   "tools/aglais_compress.cpp_"
)

# We use an alternative source file extension for those 
# files only used for tooles in order to prevent arduino from 
# compiling it automatically
#
set_source_files_properties(${aglais_compress_src} PROPERTIES LANGUAGE CXX)
set_source_files_properties(${aglais_compress_src} PROPERTIES COMPILE_FLAGS "-x c++")
set_source_files_properties(${aglais_compress_src} PROPERTIES COMPILE_DEFINITIONS "KALEIDOSCOPE_VIRTUAL_BUILD=1")

add_executable(aglais_compress ${aglais_compress_src})
set_target_properties(aglais_compress PROPERTIES LINKER_LANGUAGE CXX)
target_link_libraries(aglais_compress aglais)

