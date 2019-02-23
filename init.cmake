
macro(init_project)

set(CMAKE_DEBUG_POSTFIX "d")
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

if(NOT CMAKE_SIZEOF_VOID_P EQUAL 8)
	message(FATAL_ERROR "64 Bit is requiered.")
endif(NOT CMAKE_SIZEOF_VOID_P EQUAL 8)

mark_as_advanced(CMAKE_INSTALL_PREFIX)

set_property(GLOBAL PROPERTY AUTOGEN_TARGETS_FOLDER "Generated Files")
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

# Output everything in one directory
foreach(OUTPUTCONFIG ${CMAKE_CONFIGURATION_TYPES})
	string(TOUPPER ${OUTPUTCONFIG} OUTPUTCONFIG)
	set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_${OUTPUTCONFIG} ${PROJECT_BINARY_DIR}/target/bin)
	set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_${OUTPUTCONFIG} ${PROJECT_BINARY_DIR}/target/bin)
	set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_${OUTPUTCONFIG} ${PROJECT_BINARY_DIR}/target/lib)
endforeach(OUTPUTCONFIG CMAKE_CONFIGURATION_TYPES)

#disable visual studio c deprecation warnings
add_definitions(-D_CRT_SECURE_NO_WARNINGS)

#use math defines from math.h like M_PI and M_E
add_definitions(-D_USE_MATH_DEFINES)

endmacro(init_project)
