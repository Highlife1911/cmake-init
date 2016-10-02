
macro(add_gtest)

set(gtest_force_shared_crt ON CACHE BOOL "shared crt")

add_subdirectory(gtest/googletest)

set_property(TARGET gtest gtest_main PROPERTY FOLDER "Tests" )

endmacro(add_gtest)
