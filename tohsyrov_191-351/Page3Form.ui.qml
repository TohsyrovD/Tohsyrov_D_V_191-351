import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12


Page {//ЛР №3: Запросы к серверу по протоколу HTTP/HTTPS.
    function httpController(){ //функция для выполнения GET-запроса и обработки запроса.
        let url = "https://yandex.ru/pogoda/moscow/";
        let xhr = new XMLHttpRequest();
        xhr.open('GET', url);
        xhr.responseType = "document"
        xhr.send()
        xhr.onload = function () { //обработчик (после успешного выполнения запроса)
            //console.log("loaded")
            let textResponse = xhr.responseText //сохраняем ответ сервера в переменную
            let textResponseString = String(textResponse)
            let start = textResponseString.indexOf(">", textResponseString.indexOf(("<span"), textResponseString.indexOf("Текущая температура")))
            let end = textResponseString.indexOf("</span>", start)
            textResponseString = textResponseString.slice(start+1, end)
            temperature_field.text = textResponseString
            console.log("Текущая температура в Москве: " + textResponseString)
            textArea1.text = textResponse;
            //console.log(typeof textResponse);

        }
    }

    width: 600
    height: 400

    header: Rectangle {
        id: header
        color: "black"
        y: 0
        height: 45

        Label {
            color: "white"
            text: "Lab 3: HTTP/HTTPS запросы"
            font.weight: "DemiBold"
            font.pixelSize: 14
            anchors.verticalCenter: parent.verticalCenter
            x: 4
        }
        Rectangle{ //нижняя граница заголовка
            height: 3
            color: "#31b1da"
            anchors.top: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
        }
        //иконки
        Image {
            id: refresh
            source: "img/refresh.png"
            anchors.right: search.left
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            width: 25
            height: 25
        }
        Image {
            id: search
            source: "img/search.png"
            anchors.right: create.left
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            width: 25
            height: 25
        }
        Image {
            id: create
            source: "img/create.png"
            anchors.right: more.left
            anchors.rightMargin: 8
            anchors.verticalCenter: parent.verticalCenter
            width: 23
            height: 23
        }
        Image {
            id: more
            source: "img/more.png"
            anchors.right: parent.right
            //anchors.left: create.right
            anchors.rightMargin: 3
            anchors.verticalCenter: parent.verticalCenter
            width: 25
            height: 25
        }

    }

    ColumnLayout{
        anchors.bottom: parent.bottom
        anchors.fill: parent

        ScrollView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true

            TextArea {
                id: textArea1
                //textFormat: Qt.RichText //чтобы нормально отображалось(HTML)
                objectName: "textArea"
                readOnly: true
                //anchors.fill: parent
                background: Rectangle {
                    color: "gray"
                }
                color: "yellow"
            }
        }
        Button{
            Layout.alignment: Qt.AlignHCenter
            text: "Send Request"

            onClicked: {
                httpController();
            }

        }
        RowLayout{
            Layout.alignment: Qt.AlignHCenter
            Layout.bottomMargin: 5
            Text{
                text: "Текущая температура в Москве: "
                color: "black"
                font.pixelSize: 16
            }
            TextField{
                id: temperature_field
                color: "#31b1da"
                font.weight: "DemiBold"
                //text: "+29"
                font.pixelSize: 18
                readOnly: true
                horizontalAlignment: TextInput.AlignHCenter
                Layout.preferredWidth: 64
            }
        }
    }
}























//import QtQuick 2.12
//import QtQuick.Controls 2.5
//import QtQuick.Layouts 1.15
//import QtMultimedia 5.15
//import Qt.labs.qmlmodels 1.0

//Page {
//    header: RowLayout {
//        Label {
//            width: parent.width
//            text: qsTr("ЛР.3 ")
//            font.pointSize: 20
//            horizontalAlignment: Text.AlignHCenter
//        }
//    }
//    ColumnLayout {
//        anchors.fill: parent
//        Button {
//            id: fetchBtn
//            Layout.leftMargin: 10
//            text: qsTr("Отправить")
//            onClicked: {
//                doFetch()
//                textar.visible = true
//                fetchBtn.visible = false
//            }

//        }

//        Connections {
//                    target: root
//                    function onDataReceived(data) {
//                        textar.text = data
//                    }

//                }




//        ScrollView{
//            Layout.fillWidth: true
//                        Layout.fillHeight: true
//                        clip: true
//        TextArea {
//            id:textar
//               text: ""
//           }
//        }

//    }



//}


//RadioButton {
//    id: control
//    text: qsTr("Видео")
//    checked: true

//    contentItem: Text {
//        text: control.text
//        font: control.font
//        opacity: enabled ? 1.0 : 0.3
//        color: control.down ? "#000000" : "#000000"
//        verticalAlignment: Text.AlignVCenter
//        leftPadding: control.indicator.width + control.spacing
//    }
//    onClicked: {
//        columnlay1.visible = true
//        mediaplayer.playbackState === mediaplayer.play()
//        columnlay2.visible = false
//        button.visible = true
//        videoSlider.visible = true
//        volumeSlider.visible = true
//        volumeSlider2.visible = true
//        positionLabel.visible = true
//        camera.stop()
//        buttoncamera.visible = false
//        openButton.visible = true
//    }
//}



