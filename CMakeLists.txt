cmake_minimum_required(VERSION 3.10)
project(Terminal C)

set(CMAKE_STANDARD 11)

include_directories(src)

add_executable(${PROJECT_NAME}
	src/main.c
	src/Command/Handler.c
)

target_link_libraries(${PROJECT_NAME} pthread)
