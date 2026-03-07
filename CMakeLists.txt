cmake_minimum_required(VERSION 3.10)
project(Terminal C)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)

set(SOURCES
	src/main.c
	src/Command/Handler.c
	src/Helper/Helper.c
)

add_executable(Terminal
	${SOURCES}
)

target_include_directories(Terminal PRIVATE
	src
)

if(MSVC)
    target_compile_options(Terminal PRIVATE /std:c11)
endif()

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

	get_property(INCLUDE_DIRS TARGET Terminal PROPERTY INCLUDE_DIRECTORIES)

	set(INCLUDE_FLAGS "")
	foreach(DIR ${INCLUDE_DIRS})
		list(APPEND INCLUDE_FLAGS "/I\"${DIR}\"")
	endforeach()

	if(MSVC)
		set(ASM_FLAGS "/FAs") 
		add_custom_command(
			OUTPUT "${ASM_FILE}"
			COMMAND ${CMAKE_C_COMPILER} /FAs /Fa"${ASM_FILE}" ${INCLUDE_FLAGS} "${ABS_SOURCE}"
			DEPENDS "${ABS_SOURCE}"
			COMMENT "Generating MSVC assembly for ${REL_PATH}"
			VERBATIM
		)
	else()
		add_custom_command(
			OUTPUT "${ASM_FILE}"
			COMMAND ${CMAKE_C_COMPILER} -S -masm=intel -I${CMAKE_CURRENT_SOURCE_DIR}/src "${ABS_SOURCE}" -o "${ASM_FILE}"
			DEPENDS "${ABS_SOURCE}"
			COMMENT "Generating assembly for ${REL_PATH} -> ${ASM_FILE}"
			VERBATIM
		)
	endif()
	list(APPEND ASM_FILES "${ASM_FILE}")
endforeach()

add_custom_target(asm DEPENDS ${ASM_FILES})
