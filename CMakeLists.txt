cmake_minimum_required(VERSION 3.10)
project(Terminal C)

set(CMAKE_STANDARD 11)

set(SOURCES
	src/main.c
	src/Command/Handler.c
)

include_directories(src)

add_executable(${PROJECT_NAME}
	${SOURCES}
)

target_link_libraries(${PROJECT_NAME} pthread)

set(ASM_OUTPUT_DIR "${CMAKE_SOURCE_DIR}/assembly")
file(MAKE_DIRECTORY "${ASM_OUTPUT_DIR}")

set(ASM_FILES "")
foreach(SOURCE_FILE ${SOURCES})
	get_filename_component(ABS_SOURCE "${SOURCE_FILE}" ABSOLUTE)

	message(STATUS "DEBUG: Source: ${ABS_SOURCE}")

	file(RELATIVE_PATH REL_PATH "${CMAKE_CURRENT_SOURCE_DIR}/src" "${ABS_SOURCE}")

	set(ASM_FILE "${ASM_OUTPUT_DIR}/${REL_PATH}")
    string(REPLACE ".c" ".s" ASM_FILE "${ASM_FILE}")

	message(STATUS "DEBUG: Output: ${ASM_FILE}")

	get_filename_component(ASM_DIR ${ASM_FILE} DIRECTORY)
    file(MAKE_DIRECTORY ${ASM_DIR})

	add_custom_command(
        OUTPUT "${ASM_FILE}"
        COMMAND ${CMAKE_C_COMPILER} -S -masm=intel -I${CMAKE_CURRENT_SOURCE_DIR} "${ABS_SOURCE}" -o "${ASM_FILE}"
        DEPENDS "${ABS_SOURCE}"
        COMMENT "Generating assembly for ${REL_PATH} -> ${ASM_FILE}"
        VERBATIM
    )
	list(APPEND ASM_FILES "${ASM_FILE}")
endforeach()

add_custom_target(asm DEPENDS ${ASM_FILES})
