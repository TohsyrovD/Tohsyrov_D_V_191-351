import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtMultimedia 5.4
//import QtWinExtras 1.0
import QtQuick.Dialogs 1.0
import QtGraphicalEffects 1.12

Page {
    visible: true
    id: page2
    header: ToolBar {
        contentHeight: 15
        anchors.top: parent.top
        background:
            Rectangle {
//            implicitHeight: 30
//            implicitWidth: 100
//            color: "red"


//            Label {
//                id: label33
//                height: 56
//                color: "red"
//                text: qsTr("Запись и воспроизведение фото и видео")
//                font.pointSize: 10
//                anchors.right: parent.right
//                anchors.rightMargin: 0
//                anchors.left: parent.left
//                anchors.leftMargin: 0
//                anchors.top: parent.top
//                anchors.topMargin: 80
//                //                    font.weight: Font.DemiBold
//                //                    font.family: "Tahoma"
//                font.bold: true
//                styleColor: "#ffffff"
//                textFormat: Text.AutoText
//                horizontalAlignment: Text.AlignHCenter
//            }

//            GridLayout {
////                y: 299
////                height: 2
////                anchors.bottom: parent.bottom
////                anchors.bottomMargin: 0
////                anchors.top: parent.top
////                anchors.topMargin: 0
////                anchors.right: parent.right
////                anchors.rightMargin: 0
////                anchors.left: parent.left
////                anchors.leftMargin: 0

//            RowLayout {
//                Layout.alignment: Qt.AlignCenter
//                Layout.topMargin: 40
//                Layout.columnSpan: 3
//                Layout.row: 0


//                RadioButton {
//                    id: control
//                    text: qsTr("Видео")
//                    checked: true

//                    contentItem: Text {
//                        text: control.text
//                        font: control.font
//                        opacity: enabled ? 1.0 : 0.3
//                        color: control.down ? "#000000" : "#000000"
//                        verticalAlignment: Text.AlignVCenter
//                        leftPadding: control.indicator.width + control.spacing
//                    }
//                    onClicked: {
//                        columnlay1.visible = true
//                        mediaplayer.playbackState === mediaplayer.play()
//                        columnlay2.visible = false
//                        button.visible = true
//                        videoSlider.visible = true
//                        volumeSlider.visible = true
//                        volumeSlider2.visible = true
//                        positionLabel.visible = true
//                        camera.stop()
//                        buttoncamera.visible = false
//                        openButton.visible = true
//                    }
//                }
//                RadioButton {
//                    id: control1
//                    text: qsTr("Камера")
//                    checked: false
//                    contentItem: Text {
//                        text: control1.text
//                        font: control1.font
//                        opacity: enabled ? 1.0 : 0.3
//                        color: control1.down ? "#000000" : "#000000"
//                        verticalAlignment: Text.AlignVCenter
//                        leftPadding: control1.indicator.width + control1.spacing
//                    }
//                    onClicked: {
//                        columnlay1.visible = false
//                        mediaplayer.playbackState === mediaplayer.pause()
//                        columnlay2.visible = true
//                        camera.start()
//                        button.visible = false
//                        videoSlider.visible = false
//                        volumeSlider.visible = false
//                        volumeSlider2.visible = false
//                        positionLabel.visible = false
//                        buttoncamera.visible = true
//                        openButton.visible = false
//                    }
//                }
//            }
//        }
    }
   }

    // Видео
    GridLayout {
        y: 299
        height: 2
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0

        columns: 3
        rows: 4

        RowLayout {
            Layout.topMargin: 40
            Layout.columnSpan: 3
            Layout.row: 0
            Layout.alignment: Qt.AlignCenter

            RadioButton {
                id: control
                text: qsTr("Видео")
                checked: true

                contentItem: Text {
                    text: control.text
                    font: control.font
                    opacity: enabled ? 1.0 : 0.3
                    color: control.down ? "#000000" : "#000000"
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: control.indicator.width + control.spacing
                }
                onClicked: {
                    columnlay1.visible = true
                    mediaplayer.playbackState === mediaplayer.play()
                    columnlay2.visible = false
                    button.visible = true
                    videoSlider.visible = true
                    volumeSlider.visible = true
                    volumeSlider2.visible = true
                    positionLabel.visible = true
                    camera.stop()
                    buttoncamera.visible = false
                    openButton.visible = true
                }
            }
            RadioButton {
                id: control1
                text: qsTr("Камера")
                checked: false
                contentItem: Text {
                    text: control1.text
                    font: control1.font
                    opacity: enabled ? 1.0 : 0.3
                    color: control1.down ? "#000000" : "#000000"
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: control1.indicator.width + control1.spacing
                }
                onClicked: {
                    columnlay1.visible = false
                    mediaplayer.playbackState === mediaplayer.pause()
                    columnlay2.visible = true
                    camera.start()
                    button.visible = false
                    videoSlider.visible = false
                    volumeSlider.visible = false
                    volumeSlider2.visible = false
                    positionLabel.visible = false
                    buttoncamera.visible = true
                    openButton.visible = false
                }
            }
        }
        ColumnLayout {
            id: columnlay1
            Layout.topMargin: -10
            Layout.columnSpan: 3
            Layout.row: 1

            MediaPlayer {
                id: mediaplayer
                source: "qrc:/video/sample.avi"
                volume: volumeSlider.volume
            }

            VideoOutput {
//                height: 400
//                width: 400
                anchors.top: control1.bottom
                anchors.bottom:videoSlider.top
                Layout.fillHeight: true
                Layout.fillWidth: true
                source: mediaplayer
                id: videooutput
                //                Layout.fillWidth: true
                //                Layout.fillHeight:  true
            }

            MouseArea {
                id: playArea
                anchors.fill: parent
                onPressed: mediaplayer.play()
            }
        }

        // Камера
        ColumnLayout {
            id: columnlay2
            visible: false
            Layout.columnSpan: 3
            Layout.row: 1

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true

                Camera {
                    id: camera
                    captureMode: stop()
                    imageCapture {
                        onImageCaptured: {
                            // показывает превью скрина
                            photoPreview1.source = preview
                        }
                    }
                }

                VideoOutput {
                    id: videoCam
                    source: camera
                    focus: visible
                    anchors.fill: parent
                }

                Image {
                    Layout.column: 1
                    Layout.row: 0
                    id: photoPreview1
                    anchors.horizontalCenter: parent.horizontalCenter
                    height: 150
                    width: 200
                }
                MouseArea {}
            }
        }
        RowLayout {
            Layout.alignment: Qt.AlignCenter

            Layout.columnSpan: 3
            Layout.row: 3
            Button {
                visible: false
                id: buttoncamera
                onClicked: camera.imageCapture.captureToLocation(
                               "C:\tohsyrov_191-351\cam")
                text: "📷"
                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 40
                    color: "#ffffff"
                    border.color: control.down ? "#ffffff" : "#ffffff"
                    border.width: 1
                    radius: 5
                }
            }
        }

        Slider {
            Layout.columnSpan: 3
            Layout.row: 2
            Layout.fillWidth: true
            id: videoSlider
            to: mediaplayer.duration
            property bool sync: false
            onValueChanged: {
                if (!sync)
                    mediaplayer.seek(value)
            }
            Connections {
                target: mediaplayer
                onPositionChanged: {
                    videoSlider.sync = true
                    videoSlider.value = mediaplayer.position
                    videoSlider.sync = false
                }
            }
        }
        // кнопки плэй и пауза
        Button {

            Layout.margins: 10
            Layout.column: 0
            Layout.row: 3
            id: button
            enabled: mediaplayer.hasVideo
            Layout.preferredWidth: button.implicitHeight
            text: mediaplayer.playbackState === MediaPlayer.PlayingState ? "❙❙" : "►"
            onClicked: mediaplayer.playbackState
                       === MediaPlayer.PlayingState ? mediaplayer.pause(
                                                          ) : mediaplayer.play()

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                color: "#ffffff"
                border.color: control.down ? "#ffffff" : "#ffffff"
                border.width: 1
                radius: 5
            }
        }

        //слайдер звука
        RowLayout {
            Layout.column: 1
            Layout.row: 3
            Text {
                id: volumeSlider2
                text: qsTr("Звук:")
                color: "#000000"
                font.pixelSize: 15
            }

            Slider {

                id: volumeSlider
                property real volume: QtMultimedia.convertVolume(
                                          volumeSlider.value,
                                          QtMultimedia.LogarithmicVolumeScale,
                                          QtMultimedia.LinearVolumeScale)
            }
        }

        RowLayout {
            Layout.column: 2
            Layout.row: 3

            Label {
                id: positionLabel
                readonly property int minutes: Math.floor(
                                                   mediaplayer.position / 60000)
                readonly property int seconds: Math.round(
                                                   (mediaplayer.position % 60000) / 1000)
                text: Qt.formatTime(new Date(0, 0, 0, 0, minutes, seconds),
                                    qsTr("mm:ss"))
            }
        }
    }
}
