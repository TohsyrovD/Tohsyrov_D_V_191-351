QT += quick
QT += multimedia
QT += multimediawidgets
QT += widgets
QT += core
QT += gui
QT += network
QT += webview
QT += charts


CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        httpcontroller.cpp \
        webappcontroller.cpp \
        main.cpp \
        cryptocontroller.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

#RC_ICONS = img/icons/icon.ico

DISTFILES += \
    android/AndroidManifest.xml \
    android/build.gradle \
    android/gradle.properties \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew \
    android/gradlew.bat \
    android/res/values/libs.xml

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

HEADERS += \
    Modelsql.h \
    WebAppController.h \
    cryptocontroller.h \
    httpcontroller.h

android {
my_files.path = /assets
my_files.files = $$PWD/cryptoTest
INSTALLS += my_files
}

QMAKE_EXTRA_TARGETS += before_build makefilehook


makefilehook.target = $(MAKEFILE)

makefilehook.depends = .beforebuild

win32{
LIBS += C:\Qt\Tools\OpenSSL\Win_x64\lib\libssl.lib \
     C:\Qt\Tools\OpenSSL\Win_x64\lib\libcrypto.lib
     }
INCLUDEPATH += C:\Qt\Tools\OpenSSL\Win_x64\include\


android {
LIBS += C:\android\android_openssl-master\static\lib\arm\libssl.a \
        C:\android\android_openssl-master\static\lib\arm\libcrypto.a
}

android: include(C:\Qt\Tools\OpenSSL\android_openssl-master\openssl.pri)

INCLUDEPATH += C:/firebase_cpp_sdk/include

android {
    QT += androidextras
    LIBS += \
    C:\firebase_cpp_sdk\libs\android\armeabi-v7a\c++\libfirebase_admob.a \
    C:\firebase_cpp_sdk\libs\android\armeabi-v7a\c++\libfirebase_analytics.a \
    C:\firebase_cpp_sdk\libs\android\armeabi-v7a\c++\libfirebase_app.a \
    C:\firebase_cpp_sdk\libs\android\armeabi-v7a\c++\libfirebase_auth.a \
    C:\firebase_cpp_sdk\libs\android\armeabi-v7a\c++\libfirebase_database.a \
    C:\firebase_cpp_sdk\libs\android\armeabi-v7a\c++\libfirebase_dynamic_links.a \
    C:\firebase_cpp_sdk\libs\android\armeabi-v7a\c++\libfirebase_firestore.a \
    C:\firebase_cpp_sdk\libs\android\armeabi-v7a\c++\libfirebase_functions.a \
    C:\firebase_cpp_sdk\libs\android\armeabi-v7a\c++\libfirebase_installations.a \
    C:\firebase_cpp_sdk\libs\android\armeabi-v7a\c++\libfirebase_instance_id.a \
    C:\firebase_cpp_sdk\libs\android\armeabi-v7a\c++\libfirebase_messaging.a \
    C:\firebase_cpp_sdk\libs\android\armeabi-v7a\c++\libfirebase_remote_config.a \
    C:\firebase_cpp_sdk\libs\android\armeabi-v7a\c++\libfirebase_storage.a \

}
win32 {
    LIBS += \
    C:\firebase_cpp_sdk\libs\windows\VS2019\MD\x64\Debug\firebase_admob.lib \
    C:\firebase_cpp_sdk\libs\windows\VS2019\MD\x64\Debug\firebase_analytics.lib \
    C:\firebase_cpp_sdk\libs\windows\VS2019\MD\x64\Debug\firebase_app.lib \
    C:\firebase_cpp_sdk\libs\windows\VS2019\MD\x64\Debug\firebase_auth.lib \
    C:\firebase_cpp_sdk\libs\windows\VS2019\MD\x64\Debug\firebase_database.lib \
    C:\firebase_cpp_sdk\libs\windows\VS2019\MD\x64\Debug\firebase_dynamic_links.lib \
    C:\firebase_cpp_sdk\libs\windows\VS2019\MD\x64\Debug\firebase_firestore.lib \
    C:\firebase_cpp_sdk\libs\windows\VS2019\MD\x64\Debug\firebase_functions.lib \
    C:\firebase_cpp_sdk\libs\windows\VS2019\MD\x64\Debug\firebase_installations.lib \
    C:\firebase_cpp_sdk\libs\windows\VS2019\MD\x64\Debug\firebase_instance_id.lib \
    C:\firebase_cpp_sdk\libs\windows\VS2019\MD\x64\Debug\firebase_messaging.lib \
    C:\firebase_cpp_sdk\libs\windows\VS2019\MD\x64\Debug\firebase_remote_config.lib \
    C:\firebase_cpp_sdk\libs\windows\VS2019\MD\x64\Debug\firebase_storage.lib

}











QT += webview
QT += multimediawidgets



PRE_TARGETDEPS += .beforebuild


before_build.target = .beforebuild

before_build.depends = FORCE

before_build.commands = chcp 1251


android {
my_files.path = /assets
my_files.files = $$PWD/cryptoTest
INSTALLS += my_files
}

#android: include(C:\Qt\Tools\OpenSSL\android_openssl-master\openssl.pri)
##android: include(C:\Qt\Tools\OpenSSL\android_openssl-master\openssl.prii)
#android: include(C:/android/android_openssl-master/openssl.pri)
