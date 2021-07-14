//import QtQuick 2.12
//import QtQuick.Controls 2.5
//import QtQuick.Layouts 1.12
//import QtQuick.Controls.Material 2.12 //для настройки стиля Material
//import QtWebSockets 1.15


//Page { // ЛР 7. Простейший чат-сервер на WebSocket.

//    ListModel { //модель для ListView
//        id: listmodel1
//    }


//    WebSocket{
//        id: websocket_1
//        url: "ws://localhost:80"
//        active: true
//        onTextMessageReceived: {
//            console.log(message)

//            let list_el = {}
//            list_el["msg_text"] = message
//            list_el["is_out"] = false
//            list_el["msg_date"] = String(Qt.formatDateTime(new Date(), "dd MMMM yyyy, h:mm"))
//            listmodel1.insert(0, list_el)
//        }

//        onStatusChanged: if (websocket_1.status == WebSocket.Error) {
//                             console.log("Error: " + websocket_1.errorString)
//                         } else if (websocket_1.status == WebSocket.Open) {
//                             console.log("opened")
//                         } else if (websocket_1.status == WebSocket.Closed) {
//                             console.log("socket closed")
//                         }
//    }

//    ColumnLayout{
//        anchors.fill: parent
//        anchors.margins: 5

//        ListView{
//            id: listview1
//            Layout.fillHeight: true
//            Layout.fillWidth: true
//            Layout.topMargin: 5
//            spacing: 10
//            clip: true
//            model: listmodel1
//            verticalLayoutDirection: ListView.BottomToTop

//            delegate: Item {
//                width: listview1.width
//                height: brd_img.height

//                Image {
//                    id: brd_img
//                    width: parent.width * 1/4
//                    height: txtMessage.contentHeight  + 40 + txtDate.contentHeight
//                    source: is_out ? "" : ""
//                    anchors.left: is_out ? undefined : parent.left
//                    anchors.right: is_out ? parent.right : undefined



//                    ColumnLayout{
//                        anchors.fill: parent
//                        Layout.alignment: Qt.AlignRight
//                        anchors.topMargin: 15
//                        anchors.bottomMargin: 10
//                        anchors.leftMargin: 25
//                        anchors.rightMargin: 25

////                        Rectangle{
////                            Layout.fillHeight: true
////                            Layout.preferredWidth: 200
////                            Layout.alignment: Qt.AlignRight
//////                                Layout.leftMargin: 200
////                            Layout.topMargin: 1
////                            Layout.bottomMargin: 1
////                            radius: 50

//                        Rectangle {

//                            width: parent.width
//                            height: parent.height
//                            Layout.fillWidth: true
//                            Layout.fillHeight: true

//                             radius: 5
//                            gradient: Gradient {
//                                GradientStop { position: 0.0; color: "white" }
//                                GradientStop { position: 1.0; color: "yellow" }
//                            }


//                        TextEdit{ // текст сообщения
//                        id: txtMessage
//                        text: msg_text
//                        color: "black"
//                        font.pixelSize: 18

//                        anchors.fill: parent
//                        wrapMode: Text.Wrap
//                        readOnly: true

//                         }
//                        }
////                        }
//                        TextEdit{
//                            id: txtDate
//                            text: msg_date
//                            font.italic: true
//                            Layout.fillWidth: true
//                            horizontalAlignment: Text.AlignRight
//                            wrapMode: Text.Wrap
//                            readOnly: true
//                        }

//                    }

//                }

//            }
//        }

//        RowLayout{
//            Layout.fillWidth: true
//            Layout.fillHeight: false
//            Layout.alignment: Qt.AlignBottom
//            Layout.topMargin: 0
//            TextField{
//                id: out_msg_text
//                Layout.fillWidth: true
//                color: "white"
//            }
//            Button{
//                onClicked: {
//                    if(out_msg_text.text) {
//                        let list_el = {}
//                        list_el["msg_text"] = out_msg_text.text
//                        list_el["is_out"] = true
//                        list_el["msg_date"] = Qt.formatDateTime(new Date(), "dd MMMM yyyy, h:mm")
//                        listmodel1.insert(0, list_el)
//                        websocket_1.sendTextMessage(out_msg_text.text)
//                        out_msg_text.text = ""
//                    }
//                }
//                icon.source: "images/icon7.png"
//                icon.color: "#ffffff"
//            }
//        }
//    }

//}

import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12 //для настройки стиля Material
import QtWebSockets 1.15


Page { // ЛР 7. Простейший чат-сервер на WebSocket.

    ListModel { //модель для ListView
        id: listmodel1
    }




    WebSocket{
        id: websocket_1
        url: "ws://192.168.137.1:8000"
        active: true
        onTextMessageReceived: {
            console.log(message)

            let list_el = {}
            list_el["msg_text"] = message
            list_el["is_out"] = false
            list_el["msg_date"] = String(Qt.formatDateTime(new Date(), "dd MMMM yyyy, h:mm"))
            listmodel1.insert(0, list_el)
        }

        onStatusChanged: if (websocket_1.status == WebSocket.Error) {
                             console.log("Error: " + websocket_1.errorString)
                         } else if (websocket_1.status == WebSocket.Open) {
                             console.log("opened")
                         } else if (websocket_1.status == WebSocket.Closed) {
                             console.log("socket closed")
                         }
    }

    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 5

        ListView{
            id: listview1
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.topMargin: 5
            spacing: 10
            clip: true
            model: listmodel1
            verticalLayoutDirection: ListView.BottomToTop

            delegate: Item {
                width: listview1.width
                height: brd_img.height

                Image {
                    id: brd_img
                    width: parent.width * 3/4
                    height: txtMessage.contentHeight  + 40 + txtDate.contentHeight
                    source: is_out ? "images/Frame 45.png" : "images/Frame 46.png"
                    anchors.left: is_out ? undefined : parent.left
                    anchors.right: is_out ? parent.right : undefined

                    ColumnLayout{
                        anchors.fill: parent
                        anchors.topMargin: 15
                        anchors.bottomMargin: 10
                        anchors.leftMargin: 25
                        anchors.rightMargin: 25
                        TextEdit{ // текст сообщения
                            id: txtMessage
                            text: msg_text
                            font.pixelSize: 13
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            wrapMode: Text.Wrap
                            readOnly: true
                        }
                        TextEdit{
                            id: txtDate
                            text: msg_date
                            font.italic: true
                            Layout.fillWidth: true
                            horizontalAlignment: Text.AlignRight
                            wrapMode: Text.Wrap
                            readOnly: true
                        }
                    }
                }
            }
        }

        RowLayout{
            Layout.fillWidth: true
            Layout.fillHeight: false
            Layout.alignment: Qt.AlignBottom
            Layout.topMargin: 0
            TextField{
                id: out_msg_text
                Layout.fillWidth: true
                color: "white"
            }
            Button{
                onClicked: {
                    if(out_msg_text.text) {
                        let list_el = {}
                        list_el["msg_text"] = out_msg_text.text
                        list_el["is_out"] = true
                        list_el["msg_date"] = Qt.formatDateTime(new Date(), "dd MMMM yyyy, h:mm")
                        listmodel1.insert(0, list_el)
                        websocket_1.sendTextMessage(out_msg_text.text)
                        out_msg_text.text = ""
                    }
                }
                icon.source: "img/send_message_chat_icon.png"
                icon.color: "#31b1da"
            }
        }
    }

}
