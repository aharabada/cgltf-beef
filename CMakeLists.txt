cmake_minimum_required(VERSION 3.9)

project(cgltf)

add_library(cgltf_static STATIC cgltf_stub.c)

set_source_files_properties(cgltf_stub.c PROPERTIES LANGUAGE C)

set(CMAKE_C_STANDARD 11)
set(CMAKE_BUILD_TYPE RelWithDebInfo)

set_target_properties(cgltf_static PROPERTIES OUTPUT_NAME cgltf)