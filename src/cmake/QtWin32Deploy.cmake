# QtWin32Deploy.cmake
#
# Copyright (c) 2026 Sophie Smeeton <sophie@smeeton.icu>
#
function(win32deployqt target)

    find_package(Qt6 COMPONENTS Core REQUIRED)
    get_target_property(_qt_bin_dir Qt6::qmake IMPORTED_LOCATION)
    get_filename_component(_qt_bin_dir "${_qt_bin_dir}" DIRECTORY)
    find_program(WINDEPLOYQT_EXECUTABLE windeployqt HINTS "${_qt_bin_dir}")

    install(CODE "
        message(STATUS \"Running windeployqt...\")
        execute_process(
            COMMAND \"${WINDEPLOYQT_EXECUTABLE}\"
            --dir \"\${CMAKE_INSTALL_PREFIX}\"
            \"\${CMAKE_INSTALL_PREFIX}/${target}\")
        ")
endfunction()
