if(NOT TARGET Qt6::QuickTest)
    message(STATUS "Qt6QuickTest not found, autotests will not be built.")
    return()
endif()

add_subdirectory(controls)
