cmake_minimum_required(VERSION 3.30)
project(MyCalc)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

set(CMAKE_PREFIX_PATH "C:/Qt/6.10.2/mingw_64")

find_package(Qt6 COMPONENTS
        Core
        Qml
        Quick
        Gui
        QuickControls2
        Svg
        REQUIRED
)

qt6_add_executable(MyCalc
        main.cpp

        qml/resources.qrc
        qml/operators/resources.qrc
        qml/symbols/resources.qrc

        fonts/resources.qrc
        images/resources.qrc

        SecretSignal.h
        ParserClass.cpp
        ParserClassQML.h
)

target_link_libraries(MyCalc
        PRIVATE
        Qt6::Core
        Qt6::Qml
        Qt6::Quick
        Qt6::Gui
        Qt6::QuickControls2
        Qt6::Svg
)

set(CMAKE_BIN_DIR "${CMAKE_SOURCE_DIR}/cmake-build-debug")

if(WIN32 AND NOT DEFINED CMAKE_TOOLCHAIN_FILE)

    set(QT_BIN "${CMAKE_PREFIX_PATH}/bin")
    set(WINDEPLOYQT "${QT_BIN}/windeployqt.exe")

    if(EXISTS "${WINDEPLOYQT}")
        add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
                COMMAND "${WINDEPLOYQT}"
                --qmldir "${CMAKE_SOURCE_DIR}/qml"
                "$<TARGET_FILE:${PROJECT_NAME}>"
        )
    else()
        message(WARNING "windeployqt.exe not defined: ${WINDEPLOYQT}")
    endif()

endif()