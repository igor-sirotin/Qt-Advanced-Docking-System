ADS_OUT_ROOT = $${OUT_PWD}/..
CONFIG += c++14
CONFIG += debug_and_release
TARGET = $$qtLibraryTarget(qtadvanceddocking)
DEFINES += QT_DEPRECATED_WARNINGS
TEMPLATE = lib
DESTDIR = $${ADS_OUT_ROOT}/lib
QT += core gui widgets

!adsBuildStatic {
	CONFIG += shared
    DEFINES += ADS_SHARED_EXPORT
}
adsBuildStatic {
	CONFIG += staticlib
    DEFINES += ADS_STATIC
}

windows {
	# MinGW
	*-g++* {
		QMAKE_CXXFLAGS += -Wall -Wextra -pedantic
	}
	# MSVC
	*-msvc* {
                QMAKE_CXXFLAGS += /utf-8
        }
}

RESOURCES += ads.qrc

HEADERS += \
    include/ads/ads_globals.h \
    include/ads/DockAreaWidget.h \
    include/ads/DockAreaTabBar.h \
    include/ads/DockContainerWidget.h \
    include/ads/DockManager.h \
    include/ads/DockWidget.h \
    include/ads/DockWidgetTab.h \
    include/ads/DockingStateReader.h \
    include/ads/FloatingDockContainer.h \
    include/ads/FloatingDragPreview.h \
    include/ads/DockOverlay.h \
    include/ads/DockSplitter.h \
    include/ads/DockAreaTitleBar.h \
    include/ads/ElidingLabel.h \
    include/ads/IconProvider.h \
    include/ads/DockComponentsFactory.h  \
    include/ads/DockFocusController.h \
    src/DockAreaTitleBar_p.h


SOURCES += \
    src/ads_globals.cpp \
    src/DockAreaWidget.cpp \
    src/DockAreaTabBar.cpp \
    src/DockContainerWidget.cpp \
    src/DockManager.cpp \
    src/DockWidget.cpp \
    src/DockingStateReader.cpp \
    src/DockWidgetTab.cpp \
    src/FloatingDockContainer.cpp \
    src/FloatingDragPreview.cpp \
    src/DockOverlay.cpp \
    src/DockSplitter.cpp \
    src/DockAreaTitleBar.cpp \
    src/ElidingLabel.cpp \
    src/IconProvider.cpp \
    src/DockComponentsFactory.cpp \
    src/DockFocusController.cpp \

INCLUDEPATH = include
DEPENDPATH = include

unix:!macx {
HEADERS += include/ads/linux/FloatingWidgetTitleBar.h
SOURCES += src/linux/FloatingWidgetTitleBar.cpp
LIBS += -lxcb
QT += gui-private
}

isEmpty(PREFIX){
	PREFIX=../installed
	warning("Install Prefix not set")
}
headers.path=$$PREFIX/include
headers.files=$$HEADERS
target.path=$$PREFIX/lib
INSTALLS += headers target

DISTFILES +=
